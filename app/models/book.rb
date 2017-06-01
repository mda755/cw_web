class Book < ActiveRecord::Base
  belongs_to :stillage
  has_many :author_lists
  has_many :author, through: :author_lists
  
  validates :name, :isbn, :print_year, :stillage_id, :shelf, :copies, presence: true
  validates :isbn, uniqueness: true 
end
