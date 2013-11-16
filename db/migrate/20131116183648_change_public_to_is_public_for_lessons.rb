class ChangePublicToIsPublicForLessons < ActiveRecord::Migration
  def change
    rename_column :lessons, :public, :is_public
  end
end
