class PaycheckAdjustmentSerializer < ActiveModel::Serializer
  attributes :id, :adj_type, :adj_amount, :description
  has_one :paycheck
  has_one :employee
end
