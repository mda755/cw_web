class Author < ActiveRecord::Base
  has_many :author_lists
  has_many :books, through: :author_lists
  
  validates  :fname, :lname, :index, presence: true
end
