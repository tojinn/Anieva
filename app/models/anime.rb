class Anime < ApplicationRecord
  has_many :posts,dependent: :destroy
  has_many :bookmarks, dependent: :destroy
end
