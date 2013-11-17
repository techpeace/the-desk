class CreateStandardsIssuers < ActiveRecord::Migration
  def change
    create_table :standards_issuers do |t|
      t.string :name

      t.timestamps
    end
  end
end
