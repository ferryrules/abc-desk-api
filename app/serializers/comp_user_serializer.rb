class CompUserSerializer < ActiveModel::Serializer

  attributes :id, :email, :username, :password_digest, :permission, :fname, :lname

  belongs_to :company

  has_many :tickets
  has_many :users, through: :company
  
end
