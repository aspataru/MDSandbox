class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :description
      t.integer :country_id

      t.timestamps
    end
  end
end
