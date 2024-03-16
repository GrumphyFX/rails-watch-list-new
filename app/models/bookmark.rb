class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie, presence: true
  validates :list, presence: true
  validates :comment, length: { maximum: 500 }
end