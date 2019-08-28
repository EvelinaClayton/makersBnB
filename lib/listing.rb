require_relative 'database_connection'

class Listing

  def self.create(title:, city:)
    DatabaseConnection.setup('makers_bnb')
    result = DatabaseConnection.query("INSERT INTO properties (title, city) VALUES('#{title}', '#{city}') RETURNING id, title, city")
    Listing.new(title: result[0]['title'], city: result[0]['city'], id: result[0]['id'])
  end

  attr_reader :id, :title, :city
  def initialize(id:, title:, city:)
    @id = id
    @title = title
    @city = city

  end
end