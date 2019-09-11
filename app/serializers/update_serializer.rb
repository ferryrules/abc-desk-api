class UpdateSerializer < ActiveModel::Serializer
  attributes :id, :update_text
  has_one :user
end
