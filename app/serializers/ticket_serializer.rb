class TicketSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :priority, :category

  belongs_to :user
  belongs_to :company

  has_many :users, through: :company

end
