class CreateMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :medications do |t|
      t.string :name
      t.integer :tier
      t.timestamps
    end

    create_table :medication_users do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :medication, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
