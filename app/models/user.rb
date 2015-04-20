require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email, String
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password,
                            message: 'Sorry your passwords did not match!'

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end

end
