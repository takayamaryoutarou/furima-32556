class CreatePurchaseProcedures < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_procedures do |t|

      t.timestamps
    end
  end
end
