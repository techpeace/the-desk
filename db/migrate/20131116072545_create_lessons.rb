class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.text :body
      t.references :user, index: true
      t.string :title

      t.timestamps
    end
  end
end
