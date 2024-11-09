class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :image
      t.text :name

      t.timestamps
    end
  end
end
