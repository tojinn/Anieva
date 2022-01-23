class Anime < ApplicationRecord
  has_many :posts,dependent: :destroy
  has_many :bookmarks, dependent: :destroy
<<<<<<< HEAD
  validates :title, presence: true
  attachment :image
=======
>>>>>>> origin/develop
end
