class AddUserIdToIncomes < ActiveRecord::Migration[8.0]
  def change
    add_reference :incomes, :user, null: true, foreign_key: true
    
    # Update existing records to associate with the first user
    reversible do |dir|
      dir.up do
        if User.any?
          Income.update_all(user_id: User.first.id)
        end
      end
    end
    
    # Now make the column non-nullable
    change_column_null :incomes, :user_id, false
  end
end
