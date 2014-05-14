class CreateTigers < ActiveRecord::Migration
  def change
    create_table :tigers do |t|
    	t.string :name
	    t.string :email
	    t.string :password_digest
	    t.string :remember_token
      t.decimal :quant

      t.timestamps
    end
  end
end
