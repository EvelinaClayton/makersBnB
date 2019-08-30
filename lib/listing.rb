require_relative 'database_connection'
require_relative '../database_connection_setup'
require 'date'

class Listing

  attr_reader :id, :title, :city, :user_id, :details, :pricepernight, :date_from, :date_till

  def initialize(id, title, city, details, pricepernight, user_id, date_from, date_till)
    @id = id
    @title = title
    @city = city
    @user_id = user_id
    @details = details
    @pricepernight = pricepernight
    @date_from = date_from
    @date_till = date_till
  end

  def self.create(title, city, details, pricepernight, date_from, date_till)
    result = DatabaseConnection.query("INSERT INTO properties (title, city, details, pricepernight, date_from, date_till) 
    VALUES('#{title}', '#{city}', '#{details}', '#{pricepernight}', '#{date_from}' , '#{date_till}') 
    RETURNING id, title, city, details, pricepernight, user_id, date_from, date_till, user_id")
    Listing.new(result[0]['id'].to_i, result[0]['title'],result[0]['city'], result[0]['details'], result[0]['pricepernight'].to_i,result[0]['user_id'].to_i, result[0]['date_from'], result[0]['date_till'])
  end

  def self.edit(title, city, details, pricepernight, date_from, date_till)
    DatabaseConnection.query("UPDATE properties SET title = '#{title}', city = '#{city}', details = '#{details}', pricepernight = #{pricepernight}, date_from = '#{date_from}', date_till = '#{date_till}' WHERE id = @id")
  end

  def self.all
    result = DatabaseConnection.query("select * from properties;")
    result.map { |property| property }
  end

  def self.delete(id)
    DatabaseConnection.query("delete from properties where id = #{id}")
  end

  def self.dateStamp
    current_date = DateTime.now
    current_date.strftime "%d/%m/%Y"
  end

end

