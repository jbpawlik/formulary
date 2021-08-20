class CreateMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :medications do |t|
      t.string :name
      t.timestamps
    end

    create_table :prescriptions do |t|
      t.belongs_to :user
      t.belongs_to :medication 
      t.integer :tier
      t.timestamps
    end
  end
end
