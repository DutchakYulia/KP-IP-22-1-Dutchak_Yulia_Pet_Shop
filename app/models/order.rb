class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  enum status: { new_order: 0, paid: 1, shipped: 2, done: 3, canceled: 4 }
  enum delivery_method: { np_branch: 0, np_locker: 1, courier: 2 }
  enum payment_method: { card_mock: 0, cod: 1 }

  validates :name, :phone, :address, presence: true
end
