class AddAssociationsToStoreFlavor < ActiveRecord::Migration[5.2]
  def change
    add_reference :store_flavors, :store, foreign_key: true
    add_reference :store_flavors, :flavor, foreign_key: true
  end
end
