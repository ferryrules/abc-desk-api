class DepartmentSerializer < ActiveModel::Serializer

  attributes :id, :name

  belongs_to :company
  belongs_to :employee

end
