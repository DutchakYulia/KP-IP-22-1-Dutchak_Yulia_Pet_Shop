class ContactMessage < ApplicationRecord
  enum status: { new_msg: 0, in_progress: 1, done: 2 }

  validates :name, :email, :subject, :body, presence: true
end
