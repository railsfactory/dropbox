class AddAssetColumnsToGalleries < ActiveRecord::Migration[5.0]
  def change
        add_attachment :galleries, :asset
  end
end
