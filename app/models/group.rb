class Group < ActiveRecord::Base
  has_many :passwords
  has_many :accounts
end
