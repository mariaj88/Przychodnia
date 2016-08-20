class CreateIrenas < ActiveRecord::Migration
  def change
    create_table :irenas do |t|
      t.references :doctor, index: true, foreign_key: true
      t.references :patient, index: true, foreign_key: true
      t.date :hour

      t.timestamps null: false
    end
  end
end
