class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :user_id
      t.string :vet_id
      t.string :type
      t.string :date

      t.timestamps
    end
  end
end
