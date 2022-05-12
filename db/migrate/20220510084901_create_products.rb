class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :code, index: true, null: false
      t.string :name, index: true, null: false
      t.decimal :price, precision: 6, scale: 2

      t.timestamps
    end
  end
end
