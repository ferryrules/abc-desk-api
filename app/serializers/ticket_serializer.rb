class TicketSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :priority, :category

  belongs_to :user, optional: true
  belongs_to :company

  has_many :comp_users, through: :company
  has_many :users, through: :company

end
