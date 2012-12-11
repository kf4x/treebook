class Status < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :user 
  # status.user
  # status fild user_id


  validates_presence_of :content
  validates_length_of :content, :within => 2..140
  validates_presence_of :user_id
end
