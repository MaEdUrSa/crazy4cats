class CreateDescriptions < ActiveRecord::Migration[7.2]
  def change
    create_table :descriptions do |t|
      t.text :content
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
