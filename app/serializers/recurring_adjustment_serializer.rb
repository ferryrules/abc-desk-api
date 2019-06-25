class RecurringAdjustmentSerializer < ActiveModel::Serializer

  attributes :id, :adj_type, :adj_amount, :description

  belongs_to :employee
  
end
