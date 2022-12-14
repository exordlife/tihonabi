class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/profile.png')
      profile_image.attach(io: File.open(file_path), filename: 'profile.jpg', content_type: 'image/jpeg')
    end
    profile_image
  end
end
