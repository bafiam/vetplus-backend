class CreateVets < ActiveRecord::Migration[6.0]
  def change
    create_table :vets do |t|
      t.string :first_name
      t.string :second_name
      t.string :avatar
      t.string :tel_number
      t.string :location
      t.string :vet_number
      t.string :approved_status
      t.string :user_id

      t.timestamps
    end
  end
end
