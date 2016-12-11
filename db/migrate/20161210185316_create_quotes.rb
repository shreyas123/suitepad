class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
      t.string :quote
      t.references :author, foreign_key: true
      t.references :genre, foreign_key: true
      t.timestamps
    end
  end
end
