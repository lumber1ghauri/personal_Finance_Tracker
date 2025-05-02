class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.date :date, null: false
      t.string :description, null: false
      t.string :transaction_type, null: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end

    add_index :transactions, :date
    add_index :transactions, :transaction_type
  end
end
