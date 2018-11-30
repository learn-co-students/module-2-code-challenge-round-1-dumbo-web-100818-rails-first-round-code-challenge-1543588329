class CreatePowers < ActiveRecord::Migration[5.0]
  def change
    create_table :powers do |t|
      t.string :name
      t.string :description
      t.integer :power_id
      t.timestamps
    end
  end
end
