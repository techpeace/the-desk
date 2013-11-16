class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.text :body
      t.boolean :draft, default: true
      t.references :user, index: true
      t.string :title

      t.timestamps
    end
  end
end
