class Group < ActiveRecord::Base
  has_many :accounts
  has_and_belongs_to_many :users
end
