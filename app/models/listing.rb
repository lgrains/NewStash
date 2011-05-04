class Listing < ActiveRecord::Base
  belongs_to :users
  belongs_to :resource, :polymorphic => true
end
