class AddAnimeIdToAnimes < ActiveRecord::Migration[5.2]
  def change
    add_column :animes, :anime_id, :integer
  end
end
