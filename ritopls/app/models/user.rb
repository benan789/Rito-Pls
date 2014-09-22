require 'bcrypt'

class User
  include Mongoid::Document
  field :username, type: String
  field :email, type: String
  field :password, type: String

  has_many :comments

  def passwordarr=(passwordarr)
    if passwordarr[0] == passwordarr[1]
      self.password = BCrypt::Password.create(passwordarr[0])
    end
  end

  def authenticate(password_auth)
  	if password_auth && BCrypt::Password.new(self.password) == password_auth
  		true
  	else
  		false
  	end
  end
  
end
