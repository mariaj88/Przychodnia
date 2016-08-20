class ChangeDateColumn < ActiveRecord::Migration
  def change
    remove_column :irenas, :hour
    add_column :irenas, :hour, :datetime
  end
end
