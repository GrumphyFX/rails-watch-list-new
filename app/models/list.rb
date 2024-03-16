class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :bookmarks, allow_destroy: true, reject_if: :all_blank
end