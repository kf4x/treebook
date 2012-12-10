class Status < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :user 
  # status.user
  # status fild user_id
end
