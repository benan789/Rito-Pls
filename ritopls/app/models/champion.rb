class Champion
  include Mongoid::Document
  field :name, type: String
  field :id, type: Integer
  field :title, type: String
  field :key, type: String
  field :balanced, type: Integer
  field :buff, type: Integer
  field :nerf, type: Integer
  field :rework, type: Integer
  field :visual_update, type: Integer

  has_many :comments

end
