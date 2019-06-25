class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :password_digest, :permission
  has_one :company
end
