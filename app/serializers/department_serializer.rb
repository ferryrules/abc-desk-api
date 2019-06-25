class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :company
  has_one :employee
end
