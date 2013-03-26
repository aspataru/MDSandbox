class CreateResorts < ActiveRecord::Migration
  def change
    create_table :resorts do |t|
      t.string :name
      t.string :description
      t.integer :resort_id

      t.timestamps
    end
  end
end
