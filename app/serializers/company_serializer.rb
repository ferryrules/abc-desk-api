class CompanySerializer < ActiveModel::Serializer

  attributes :id, :name

  has_many :departments
  has_many :payrolls
  has_many :tickets

  has_many :comp_users
  has_many :users, through: :comp_users

  has_many :employees
  has_many :employees, through: :departments

end
