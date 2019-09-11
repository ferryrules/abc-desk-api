class TicketSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :priority, :category, :ticket_status, :updates

  belongs_to :user, optional: true
  belongs_to :company
  # belongs_to :department, optional: true

  has_many :comp_users, through: :company
  has_many :users, through: :company

  has_many :updates
  
end
