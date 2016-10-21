class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.integer :parent_id
      t.integer :user_id
      t.string :type
      t.string :name
      t.boolean :visible
      t.string :icon_url
      t.string :url
      t.string :mime_type
      t.string :name_search
      t.integer :position

      t.timestamps
    end
  end
end
