class CreateAssetConfigurations < ActiveRecord::Migration
  def change
    create_table :asset_configurations do |t|

      t.timestamps
    end
  end
end
