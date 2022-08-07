class Post < ApplicationRecord
  has_many_attached :image
  belongs_to :user
  belongs_to :genre
  
  with_options presence: true do
    validates :image
  end
  
  def self.search(keyword)
    where(["title like? OR content like?", "%#{keyword}%", "%#{keyword}%"])
  end
  
end
