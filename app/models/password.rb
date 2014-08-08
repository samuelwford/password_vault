class Password < ActiveRecord::Base
  belongs_to :group
  delegate :name, to: :group, prefix: true, allow_nil: true
end
