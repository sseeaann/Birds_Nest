class Product < ActiveRecord::Base
	validates :name, :description, :price, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0}

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end

