class ChangeColumnType < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :type, :booking_type
  end
end
