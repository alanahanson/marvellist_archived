class CreateIssues < ActiveRecord::Migration
  def change
    create_table(:issues) do |t|
      t.string :title
      t.integer :issue_number
      t.string :url
      t.date :on_sale_date
      t.string :thumbnail
      t.references :series
    end
  end
end

