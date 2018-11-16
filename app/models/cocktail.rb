class Cocktail < ApplicationRecord
  has_many :doses, dependent: :delete_all
  has_many :ingredients, through: :doses

  validates :name, uniqueness: true, presence: true
  mount_uploader :photo, PhotoUploader

  before_create :assign_url

  private

  def assign_url
    self.remote_photo_url = 'https://img.delicious.com.au/CKMUcpx-/w1200/del/2015/11/summer-cocktails-24374-3.jpg' if photo_url.nil?
  end
end
