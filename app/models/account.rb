class Account < ActiveRecord::Base
  validates :name, presence: true
  validates :group, presence: true
  
  belongs_to :group
  
  has_many :activities, -> { order(created_at: :desc) }
  
  def record_created_by(user)
    record_action_by user, :account_created
  end
  
  def record_viewed_by(user)
    record_action_by user, :account_viewed
  end
  
  def record_edited_by(user)
    record_action_by user, :account_edited
  end
  
  def record_changed_by(user)
    record_action_by user, :account_changed
  end
  
  private 
  
  def record_action_by(user, action)
    if self.new_record?
      activities.build(user: user, action: action)
    else
      activities.create(user: user, action: action)
    end
  end
  
  def self.import!(row)
    group = Group.find_or_create_by_name(row["Group"])
    account = Account.new(group: group, name: row["Title"], account_name: row["Username"], url: row["URL"], password: row["Password"], notes: row["Notes"])
    account.save!
  end
end
