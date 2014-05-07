class CreateSelfies < ActiveRecord::Migration
  def change
    create_table :selfies do |t|
      t.text :description
      t.string :source_url

      t.timestamps
    end
  end
end
