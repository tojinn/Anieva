class AddColumnsPosts < ActiveRecord::Migration[5.2]
  def change
     add_column :posts, :customer_id, :integer
     add_column :posts, :anime_id, :integer
  end
end
