class AuthorList < ActiveRecord::Base
  belongs_to :author
  belongs_to :book
  
  validates :author, :book, presence: true
  validates :author_id, uniqueness: {scope: [:book_id]}
end
