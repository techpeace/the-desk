class RecreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.references :user
      t.string :grade
      t.references :standard_course
    end
  end
end
