class User < ActiveRecord::Base
  has_many :contacts
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :address_street, :address_city, :address_state, :address_zip, presence: true
  validates :address_state, length: {is: 2}
  validates :address_zip, length: {is: 5}
end
