class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :beer, foreign_key: true
      t.text :aroma
      t.text :look
      t.text :taste
      t.text :bitterness
      t.text :mouthfeel
      t.text :summary
      t.integer :aroma_score
      t.integer :look_score
      t.integer :taste_score
      t.integer :bitterness_score
      t.integer :mouthfeel_score
      t.integer :total_score
    end
  end
end
