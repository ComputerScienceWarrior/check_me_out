class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.text :header
      t.text :description
      t.string :category
      t.integer :user_id

      t.timestamps
    end
  end
end
