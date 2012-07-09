class User < ActiveRecord::Base
  has_attached_file :profpic,
    :dependent => :destroy,
    :styles => { :medium => "200x200", :thumb => "150x150" },
    :storage => :s3,
    :bucket => ENV['S3_BUCKET_NAME'],
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  has_attached_file :resume, 
    :dependent => :destroy,
    :storage => :s3,
    :bucket => ENV['S3_BUCKET_NAME'],
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :name, :profpic, :resume, :bio, :graduation

  validates_presence_of :name
  validates_attachment_content_type :profpic, :content_type => ["image/jpeg", "image/png", "image/jpg"]
  validates_attachment_content_type :resume, :content_type => ["application/pdf"]

  GRADUATION = ['Fall 2012', 'Spring 2013', 'Summer 2013', 'Fall 2013', 'Spring 2014',
                'Summer 2014', 'Fall 2014', 'Spring 2015', 'Summer 2015', 'Fall 2015']

end
