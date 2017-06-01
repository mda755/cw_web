class Stillage < ActiveRecord::Base
  belongs_to :hall
  
  validates :index, :hall, presence: true
end
