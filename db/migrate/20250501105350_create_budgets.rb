class CreateBudgets < ActiveRecord::Migration[8.0]
  def change
    create_table :budgets do |t|
      t.decimal :amount
      t.string :category
      t.date :date
      t.text :notes

      t.timestamps
    end
  end
end
