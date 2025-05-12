class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.string :category
      t.date :date
      t.decimal :amount

      t.timestamps
    end
  end
end
