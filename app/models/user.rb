class User < ActiveRecord::Base
  has_attached_file :profpic, :styles => { :medium => "300x300", :thumb => "100x100" }
  has_attached_file :resume
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :name, :profpic, :resume

  validates_presence_of :name

end
