class CompUserSerializer < ActiveModel::Serializer
  attributes :id
  has_one :company
  has_one :user
end
