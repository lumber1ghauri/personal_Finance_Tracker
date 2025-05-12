json.extract! transaction, :id, :category, :date, :amount, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
