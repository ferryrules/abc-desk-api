class CompanySerializer < ActiveModel::Serializer

  attributes :id, :name

  has_many :departments
  has_many :payrolls
  has_many :tickets

  has_many :employees
  has_many :employees, through: :departments

  belongs_to :user

end
