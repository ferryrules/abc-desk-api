class UserSerializer < ActiveModel::Serializer

  attributes :id, :email, :username, :permission, :fname, :lname

  has_many :comp_user
  has_many :companies, through: :comp_user

  has_many :tickets
  has_many :tickets, through: :companies

end
