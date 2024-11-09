class CreateActions < ActiveRecord::Migration[7.2]
  def change
    create_table :actions do |t|
      t.string :kind
      t.references :article, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
