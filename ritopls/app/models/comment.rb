class Comment
  include Mongoid::Document
  field :votes, type: Integer
  field :text, type: String

  belongs_to :user
  belongs_to :champion
end
