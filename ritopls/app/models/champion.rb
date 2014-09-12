class Champion
  include Mongoid::Document
  field :name, type: String
  field :balanced, type: Integer
  field :buff, type: Integer
  field :nerf, type: Integer
  field :reword, type: Integer
  field :avatar, type: String

  has_many :comments
end
