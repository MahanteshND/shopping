class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products, force: :cascade do |t|
      t.string :name
      t.decimal :price, default: 0.0

      t.timestamps
    end
  end
end
