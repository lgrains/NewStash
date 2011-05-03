class Role < ActiveRecord::Base

  # associations
  has_many :users

end