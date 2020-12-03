class Topic < ApplicationRecord
  validates :description, {presence: true, length:{maximum: 140}}
  validates :user_id, {presence: true}
  validates :image, presence: true
  
  belongs_to :user

  mount_uploader :image, ImageUploader
  
  def user
    return User.find_by(id: self.user_id)
  end
end
