class Account < ActiveRecord::Base
  validates :name, presence: true
  validates :group, presence: true
  
  belongs_to :group
end
