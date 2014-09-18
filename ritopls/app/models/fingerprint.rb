class Fingerprint
  include Mongoid::Document
  field :hash, type: String
  field :token, type: Integer
end
