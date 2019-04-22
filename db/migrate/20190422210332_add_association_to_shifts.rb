class AddAssociationToShifts < ActiveRecord::Migration[5.2]
  def change
    add_reference :shifts, :assignment, foreign_key: true
  end
end
