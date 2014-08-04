class CreatePasswords < ActiveRecord::Migration
  def change
    create_table :passwords do |t|
      t.string :name
      t.string :password
      t.text :notes
      t.references :group, index: true

      t.timestamps
    end
  end
end
