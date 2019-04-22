class AddFieldsToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :name, :string
    add_column :jobs, :description, :string
    add_column :jobs, :active, :boolean
  end
end
