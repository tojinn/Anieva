class AddProfileImageIdToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :profile_image_id, :string
  end
end
