class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :second_name
      t.string :avatar
      t.string :tel_number
      t.string :location

      t.timestamps
    end
  end
end
