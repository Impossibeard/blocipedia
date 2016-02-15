class AddLastChargeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_charge, :string
  end
end
