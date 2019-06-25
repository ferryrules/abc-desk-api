class RecurringAdjustmentSerializer < ActiveModel::Serializer
  attributes :id, :adj_type, :adj_amount, :description
  has_one :employee
end
