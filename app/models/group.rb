class Group < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :accounts
  has_and_belongs_to_many :users
end
