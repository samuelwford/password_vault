class AddNameAndAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :admin, :bool
  end
end
