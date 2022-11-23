class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description
      t.integer :price, default: 0
      t.jsonb :image_data

      t.timestamps
    end
  end
end
