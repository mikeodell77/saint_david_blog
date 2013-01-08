class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :blog_entries, :image, :bio
  # attr_accessible :title, :body

  has_many :blog_entries

  validates :bio, :presence => true

  mount_uploader :image, ImageUploader


  def get_last_blog_entry
  	blogEntry = self.blog_entries.last
  end

  def bio_appender
  	self.bio
  end
end
