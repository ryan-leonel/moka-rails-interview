class Item < ActiveRecord::Base
  belongs_to :business

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :business_id, presence: true
end
