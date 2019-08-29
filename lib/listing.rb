require_relative 'database_connection'

class Listing

  attr_reader :id, :title, :city, :user_id

  def initialize(id:, title:, city:, user_id:)
    @id = id
    @title = title
    @city = city
    @user_id = user_id
  end

  def self.create(title:, city:)
    DatabaseConnection.setup('makers_bnb')
    result = DatabaseConnection.query("INSERT INTO properties (title, city) VALUES('#{title}', '#{city}') RETURNING id, title, city, user_id")
    Listing.new(id: result[0]['id'], title: result[0]['title'], city: result[0]['city'], user_id: result[0]['user_id'])
  end

  # def self.edit(title:, city:)
  #   DatabaseConnection.setup('makers_bnb')
  #   DatabaseConnection.query("insert into properties (title, city) values ('#{title}', '#{city}' where id = #{@id}")
  # end

  def self.all
    DatabaseConnection.setup('makers_bnb')
    result = DatabaseConnection.query("select * from properties;")
    result.map { |property| property }
  end


end
