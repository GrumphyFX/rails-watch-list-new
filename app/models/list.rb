class List < ApplicationRecord
  has_many :bookmarks
  has_many :movies, through: :bookmarks
  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :bookmarks
end