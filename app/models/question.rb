class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, length: { maximum: 3000 }
end
