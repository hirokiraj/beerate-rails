class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :name, null: false
      t.string :brewery, null: false
      t.string :country

      t.integer :international_bitterness_unit
      t.float :alcohol_by_volume
      t.float :final_gravity
      t.float :original_gravity

      t.string :style, null: false
      t.string :malts, default: ''
      t.string :yeasts, default: ''
      t.string :hops, default: ''
      t.string :special_ingredients, default: ''
    end
  end
end
