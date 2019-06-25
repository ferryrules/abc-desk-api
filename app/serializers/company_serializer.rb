class CompanySerializer < ActiveModel::Serializer
  
  attributes :id, :name

  has_many :departments
  has_many :payrolls
  has_many :tickets

  has_many :employees
  has_many :employees, through: :departments

  has_many :users
  has_many :users, through: :tickets

end
