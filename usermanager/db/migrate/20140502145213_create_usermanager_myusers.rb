class CreateUsermanagerMyusers < ActiveRecord::Migration
  def change
    create_table :usermanager_myusers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
