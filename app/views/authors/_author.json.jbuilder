json.extract! author, :id, :fname, :sname, :lname, :index, :created_at, :updated_at
json.url author_url(author, format: :json)
