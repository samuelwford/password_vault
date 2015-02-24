class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :user, index: true
      t.references :account, index: true
      t.integer :action

      t.timestamps
    end
  end
end
