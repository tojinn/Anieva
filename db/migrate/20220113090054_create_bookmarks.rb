class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.references :customer, foreign_key: true
      t.references :anime, foreign_key: true

      t.timestamps
    end
    add_index :bookmarks, [:customer_id, :anime_id], unique: :true
  end
end
