require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email, String
  property :password_digest, Text, required: true,
                                   message: 'Sorry, there was something'\
                                     ' wrong with your password!'

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password,
                            message: 'Sorry your passwords did not match!'

  def password=(password)
    return nil if password.empty?
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end

end
