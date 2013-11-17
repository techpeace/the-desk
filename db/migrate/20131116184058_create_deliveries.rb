class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.datetime :date
      t.references :lesson, index: true

      t.timestamps
    end
  end
end
