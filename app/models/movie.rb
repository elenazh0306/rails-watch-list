class Movie < ApplicationRecord
  has_many :bookmarks
  has_one_attached :photo

  validates :title, uniqueness: true, presence: true
  validates :overview, uniqueness: true, presence: true
end
