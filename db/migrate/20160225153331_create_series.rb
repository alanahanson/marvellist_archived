class CreateSeries < ActiveRecord::Migration
  def change
    create_table(:series) do |t|
      t.string :title
      t.string :link
      t.string :description
      t.integer :num_issues
      t.integer :series_id
    end
  end
end
