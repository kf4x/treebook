class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  					:first_name, :last_name, :profile_name
  # attr_accessible :title, :body

  validates_presence_of :first_name#, :message => "can't be blank"
  validates_presence_of :last_name#, :message => "can't be blank"
  validates_presence_of :profile_name#, :message => "can't be blank"

  validates_uniqueness_of :profile_name

  validates_format_of :profile_name, :with => /a-zA-Z\-\_+/, :message => "Must be formatted correctly."
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :profile_name, presence: true, uniqueness: true


  has_many :statuses

  def full_name
  	first_name + " " + last_name
  end
end
