class CreateStoreFlavors < ActiveRecord::Migration[5.2]
  def change
    create_table :store_flavors do |t|

      t.timestamps
    end
  end
end
