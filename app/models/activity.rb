class Activity < ActiveRecord::Base
  enum action: [:account_created, :account_viewed, :account_edited, :account_changed]
  belongs_to :user
  belongs_to :account
end
