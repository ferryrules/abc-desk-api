class UserSerializer < ActiveModel::Serializer

  attributes :id, :email, :username, :password_digest, :permission

  belongs_to :company

  has_many :tickets, through: :company

end
