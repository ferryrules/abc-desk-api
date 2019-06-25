class TicketSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :priority, :category
  has_one :user
  has_one :company
end
