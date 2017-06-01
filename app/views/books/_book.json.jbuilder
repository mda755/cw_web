json.extract! book, :id, :name, :part, :isbn, :print_year, :stillage_id, :shelf, :copies, :created_at, :updated_at
json.url book_url(book, format: :json)
