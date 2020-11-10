class Question < ApplicationRecord
  validates :title, :correct, presence: true
  validates :title, uniqueness: true
end
