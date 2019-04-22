class AddFieldsToFlavors < ActiveRecord::Migration[5.2]
  def change
    add_column :flavors, :name, :string
    add_column :flavors, :active, :boolean
  end
end
