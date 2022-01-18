class Anime < ApplicationRecord
  has_many :posts,dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  validates :title, presence: true
end
