class CreateLessonStandards < ActiveRecord::Migration
  def change
    create_table :lesson_standards do |t|
      t.references :lesson
      t.references :standard

      t.timestamps
    end
  end
end
