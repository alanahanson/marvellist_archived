class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.string :url
      t.string :thumbnail
      t.integer :issue_number
      t.date :on_sale_date
      t.references :series, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
