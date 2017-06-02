class Hall < ActiveRecord::Base
  has_many :stillages, dependent: :destroy
  
  validates :name_full, :name_short, presence: true
  validates :name_full, uniqueness: {scope: [:name_short]}
end
