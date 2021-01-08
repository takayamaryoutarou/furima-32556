class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|


      t.string     :title,                  null: false
      t.integer    :category_id,            null: false
      t.integer    :state_id,               null: false
      t.references :user,                   foreign_key: true
      t.integer    :prefecture_id,          null: false
      t.integer    :delivery_date_id,       null: false
      t.integer    :price,                  null: false
      t.integer    :delivery_charge_id,     null: false
      t.text       :product_description,    null: false
      t.timestamps
    end
  end
end
