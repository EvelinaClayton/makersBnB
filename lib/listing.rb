require_relative 'database_connection'
require_relative '../database_connection_setup'

class Listing
   
  # DEFAULT_PRICE = 35

  attr_reader :id, :title, :city, :user_id, :details, :pricepernight

  def initialize(id:, title:, city:, details:, pricepernight:, user_id:)
    @id = id
    @title = title
    @city = city
    @user_id = user_id
    @details = details
    @pricepernight = pricepernight
  end

  def self.create(title:, city:, details:, pricepernight:)
    result = DatabaseConnection.query("INSERT INTO properties (title, city, details, pricepernight) VALUES('#{title}', '#{city}', '#{details}', '#{pricepernight}') RETURNING id, title, city, details, pricepernight, user_id")
    Listing.new(id: result[0]['id'], title: result[0]['title'], city: result[0]['city'], details: result[0]['details'], pricepernight: result[0]['pricepernight'].to_i, user_id: result[0]['user_id'])
  end

  def self.edit(title:, city:, details:, pricepernight:)
    DatabaseConnection.query("update properties (title, city, details, pricepernight) values ('#{title}', '#{city}', '#{details}', #{pricepernight}) where id = #{@id}")
  end

  def self.all
    result = DatabaseConnection.query("select * from properties;")
    result.map { |property| property }
  end

  def self.delete(id)
    DatabaseConnection.query("delete from properties where id = #{id}")
  end


end
