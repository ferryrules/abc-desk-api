class UserSerializer < ActiveModel::Serializer

  attributes :id, :email, :username, :permission, :fname, :lname

  has_many :companies
  has_many :tickets

  has_many :tickets, through: :companies

end
