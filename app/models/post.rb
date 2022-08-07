class Post < ApplicationRecord
  has_many_attached :image
  belongs_to :user
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  with_options presence: true do
    validates :image
  end
  
  def self.search(keyword)
    where(["title like? OR content like?", "%#{keyword}%", "%#{keyword}%"])
  end
  
end
