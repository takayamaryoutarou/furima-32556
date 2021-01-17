class CreateDeliveryDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_destinations do |t|
      
      t.string :postal_code,      null: false
      t.integer :prefecture_id,   null: false
      t.string :city,             null: false
      t.string :block,            null: false
      t.string :building_name,    null: false
      t.string :phone_number,     null: false
      t.references :purchase,     foreign_key: true

      t.timestamps
    end
  end
end
