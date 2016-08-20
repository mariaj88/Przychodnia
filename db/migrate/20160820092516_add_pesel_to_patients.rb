class AddPeselToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :pesel, :string
  end
end
