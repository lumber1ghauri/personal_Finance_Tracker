class CreateIncomes < ActiveRecord::Migration[8.0]
  def change
    create_table :incomes do |t|
      t.string :title
      t.decimal :amount
      t.date :date
      t.text :note

      t.timestamps
    end
  end
end
