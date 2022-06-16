class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :fuel_type
      t.string :gearbox
      t.datetime :year
      t.timestamps
    end
  end
end
