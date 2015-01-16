class AddDetailsToPassword < ActiveRecord::Migration
  def change
    add_column :passwords, :account_name, :string
    add_column :passwords, :url, :string
  end
end
