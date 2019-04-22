class AddFieldsToShifts < ActiveRecord::Migration[5.2]
  def change
    add_column :shifts, :date, :date
    add_column :shifts, :start_time, :time
    add_column :shifts, :end_time, :time
    add_column :shifts, :notes, :text
  end
end
