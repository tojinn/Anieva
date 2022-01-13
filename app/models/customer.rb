class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  #お気に入り機能機能
  has_many :bookmarks, dependent: :destroy

  def bookmark?(anime)
    bookmarks.find_by(anime_id:anime.id).present?
  end
end
