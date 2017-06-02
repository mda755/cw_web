class Author < ActiveRecord::Base
  has_many :author_lists, dependent: :destroy
  has_many :books, through: :author_lists
  
  validates  :fname, :lname, :index, presence: true
end
