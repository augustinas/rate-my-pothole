require 'bcrypt'

class User

  MIN_PSWD_LENGTH = 6
  include DataMapper::Resource

  property :id, Serial
  property :username, String, unique: true,
                              message: 'Sorry, This username already exists!'
  property :email, String, unique: true,
                           message: 'Sorry, A user with'\
                           ' this email already exists!'
  property :password_digest, Text, required: true,
                                   message: 'Sorry, your password was too short'

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password,
                            message: 'Sorry your passwords did not match!'

  def password=(password)
    return nil if password.length < MIN_PSWD_LENGTH
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end

end
