class ChangeUserToProfileInAppointment < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :user_id, :profile_id
  end
end
