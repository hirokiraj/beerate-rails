class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :beer, foreign_key: true
      t.text :aroma
      t.text :appearance
      t.text :flavor
      t.text :mouthfeel
      t.text :overall

      t.integer :aroma_score, null: false
      t.integer :appearance_score, null: false
      t.integer :flavor_score, null: false
      t.integer :mouthfeel_score, null: false
      t.integer :overall_score, null: false
      t.integer :total_score, null: false

      t.integer :stylistic_accuracy, null: false
      t.integer :technical_merit, null: false
      t.integer :intangibles, null: false

      t.boolean :acetaldehyde
      t.boolean :alcoholic
      t.boolean :astringent
      t.boolean :diacetyl
      t.boolean :dms
      t.boolean :estery
      t.boolean :grassy
      t.boolean :light_struck
      t.boolean :metallic
      t.boolean :musty
      t.boolean :oxidized
      t.boolean :phenolic
      t.boolean :solvent
      t.boolean :sour_acidic
      t.boolean :sulfur
      t.boolean :vegetal
      t.boolean :yeasty
    end
  end
end
