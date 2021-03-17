class Hotel < ApplicationRecord
    has_many_attached :images, :dependent => :destroy
    has_many :services, :dependent => :destroy
    
    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :location, presence: true
    
end
