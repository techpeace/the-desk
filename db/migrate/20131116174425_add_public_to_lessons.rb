class AddPublicToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :public, :boolean, default: false
  end
end
