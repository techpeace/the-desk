class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.text :text
      t.string :key
      t.string :grade
      t.string :keywords
      t.belongs_to :course, index: true
      t.belongs_to :standards_issuer
      t.timestamps
    end
  end
end
