class User
  include Mongoid::Document
  field :username, type: String
  field :email, type: String
  field :password, type: String

  has_many :comments

  # def password=(input_password)
  # 	self.password = input_password
  # end

  def authenticate(password_auth)
  	if password_auth && self.password == password_auth
  		true
  	else
  		false
  	end
  end
  
end
