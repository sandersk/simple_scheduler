class Changepersoncolumn < ActiveRecord::Migration

  def change
    rename_column :appointments, :person, :user_id
  end

end
