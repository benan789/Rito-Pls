class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :votes, type: Integer
  field :text, type: String
  field :username, type: String

  belongs_to :user
  belongs_to :champion
end
	