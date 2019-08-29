require_relative 'database_connection'

class User

  attr_reader :id, :email

  def initialize(email:, id:)
    # @name = name
    @email = email
    @id = id
    @listings = set_listings
  end

  def set_listings
    connection = DatabaseConnection.setup('makers_bnb')
    result = DatabaseConnection.query('select * from properties where user_id = id')
    result.map{ |property| property }
  end

  def self.create(email:, password:)
    DatabaseConnection.setup('makers_bnb')
    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES('#{email}', '#{password}') RETURNING id, email")
    User.new(email: result[0]['email'], id: result[0]['id'])
  end

end
