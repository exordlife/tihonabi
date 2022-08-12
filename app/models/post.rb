class Post < ApplicationRecord
  has_many_attached :image
  belongs_to :user
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  with_options presence: true do
    validates :image
  end
  
  
  
  def self.search(keyword)
    where(["title like? OR content like?", "%#{keyword}%", "%#{keyword}%"])
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
