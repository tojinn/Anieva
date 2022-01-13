class Bookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :anime
  
  validates :customer_id, uniqueness: { scope: :anime_id}
end
