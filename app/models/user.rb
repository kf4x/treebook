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

  #presence Check
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :profile_name

  #unique Check
  validates_uniqueness_of :profile_name

  #format Check
  validates_format_of :profile_name, 
                      :with => /^[a-zA-Z0-9_-]+$/,
                      :message => "Must be formatted correctly."

  #relationship
  has_many :statuses
  has_many :user_friendships
  has_many :friends, :through => :user_friendships

  def full_name
  	first_name + " " + last_name
  end

  def gravatar_url
    strippedEmail = email.strip                       #removed leading and trailing spaces
    lowerEmail = strippedEmail.downcase               #downcase email
    hashedEmail = Digest::MD5.hexdigest(lowerEmail)   #hash

    "http://gravatar.com/avatar/#{hashedEmail}"       #create hotlink to img
  end

end
