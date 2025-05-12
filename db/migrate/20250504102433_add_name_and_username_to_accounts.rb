class AddNameAndUsernameToAccounts < ActiveRecord::Migration[8.0]
  def change
    add_column :accounts, :name, :string
    add_column :accounts, :username, :string
  end
end
