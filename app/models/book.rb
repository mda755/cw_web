class Book < ActiveRecord::Base
  belongs_to :stillage
  has_many :author_lists, dependent: :destroy
  has_many :authors, through: :author_lists
  
  validates :name, :isbn, :print_year, :stillage_id, :shelf, :copies, presence: true
  validates :isbn, uniqueness: true 

  accepts_nested_attributes_for :author_lists, allow_destroy: true
  accepts_nested_attributes_for :authors, allow_destroy: true

  def self.search(params)
    result = Book.includes(:authors).includes(:stillage => :hall).references(:authors).references(:stillage => :hall)
    if params['name'].present?
      result = result.where(name: params['name'])
    end
    if params['isbn'].present?
      result = result.where(isbn: params['isbn'])
    end
    if params['print_year'].present?
      result = result.where(print_year: params['print_year'])
    end
    if params['copies'].present?
      result = result.where(copies: params['copies'])
    end
    if params['stillage'].present?
      result = result.where(stillage: params['stillage'])
    end
    if params['name_full'].present?
      result = result.where(halls: {name_full: params['name_full']})
    end
    if params['name_short'].present?
      result = result.where(halls: {name_short: params['name_short']})
    end
    if params['index'].present?
      result = result.where(authors: {index: params['index']})
    end
    if params['fname'].present?
      result = result.where(authors: {fname: params['fname']})
    end
    if params['sname'].present?
      result = result.where(authors: {sname: params['sname']})
    end
    if params['lname'].present?
      result = result.where(authors: {lname: params['lname']})
    end
    result.all
  end
end
