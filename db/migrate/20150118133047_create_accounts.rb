class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :password
      t.text :notes
      t.references :group, index: true
      t.string :account_name
      t.string :url

      t.timestamps
    end
  end
end
