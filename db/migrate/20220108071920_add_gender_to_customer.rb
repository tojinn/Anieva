class AddGenderToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :gender, :integer, null: false, default: 0
  end

end
