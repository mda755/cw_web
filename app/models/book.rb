class Book < ActiveRecord::Base
  belongs_to :stillage
  has_many :author_lists, dependent: :destroy, inverse_of: :book
  has_many :authors, through: :author_lists
  
  validates :name, :isbn, :print_year, :stillage_id, :shelf, :copies, presence: true
  validates :isbn, uniqueness: true 

  accepts_nested_attributes_for :author_lists, allow_destroy: true
  accepts_nested_attributes_for :authors, allow_destroy: true
end
