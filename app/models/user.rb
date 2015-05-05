class User < ActiveRecord::Base
  has_many :contacts
  has_many :orders
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :address_street, :address_city, :address_state, :address_zip, presence: true
  validates :address_state, length: {is: 2}
  validates :address_zip, length: {is: 5}
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
