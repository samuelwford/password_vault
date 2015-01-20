class DropPasswords < ActiveRecord::Migration
  def change
    drop_table :passwords
  end
end
