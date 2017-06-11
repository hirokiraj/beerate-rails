class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :brewery
      t.string :country
      t.integer :international_bitterness_unit
      t.float :alcohol_by_volume
      t.float :original_gravity
      t.string :style
    end
  end
end
