class Password < ActiveRecord::Base
  validates :name, presence: true
  validates :group, presence: true
  
  belongs_to :group
  delegate :name, to: :group, prefix: true, allow_nil: true
end
