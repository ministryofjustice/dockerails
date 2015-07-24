class Access < ActiveRecord::Base
  validates :hash, presence: true
end
