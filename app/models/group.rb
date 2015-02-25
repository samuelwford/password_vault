class Group < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :accounts
  has_and_belongs_to_many :users
  
  def self.find_or_create_by_name(name)
    group = Group.where(name: name).first
    if group.nil?
      group = Group.new(name: name)
    end
    group
  end
end
