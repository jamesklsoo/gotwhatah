class Location < ApplicationRecord
  has_many :users
  enum area: [:subang_jaya, :damansara, :ttdi]
end
