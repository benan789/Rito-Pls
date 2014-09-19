class Fingerprint
  include Mongoid::Document
  field :hash, type: String
end
