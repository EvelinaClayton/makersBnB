require_relative 'database_connection'
require_relative '../database_connection_setup'
require_relative './listing'
require 'bcrypt'

class User

  attr_reader :id, :email

  def initialize(email, id)
    @email = email
    @id = id
    @listings = set_listings
  end

  def set_listings
    result = DatabaseConnection.query('select * from properties where user_id = id')
    result.map{ |property| property }
  end

  def self.create(email, password)
    encrypted_password = BCrypt::Password.create(password)
    check = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'").to_a.pop
    # return unless check.any?
    if check['email'] == email
      raise 'this email address is already taken'
    else
      result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES('#{email}', '#{encrypted_password}') RETURNING id, email")
      User.new(result[0]['email'], result[0]['id'].to_i)
    end
  end

  def self.authenticate(email, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(result[0]['email'], result[0]['id'])
  end  

  def addListing(title, city, details, ppn, date_from, date_till)
    Listing.create(title, city, details, ppn, date_from, date_till)
  end

end
