class CreateBees < ActiveRecord::Migration
  def change
    create_table :bees do |t|
    	t.string :name
	    t.string :email
	    t.string :password_digest
	    t.string :remember_token
      t.string :summary
      t.decimal :data

      t.timestamps
    end
  end
end
