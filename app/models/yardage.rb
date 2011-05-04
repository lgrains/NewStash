class Yardage < ActiveRecord::Base
  has_one :listing, :as => :resource
end
