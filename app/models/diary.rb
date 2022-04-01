class Diary < ApplicationRecord
  validates :diary_date, presence: true
  validates :title, presence: true, length: { in: 0..14 }
  validates :images, content_type: [:png, :jpg, :jpeg], length: {maximum: 3, message: "は3つまでです"}
  
  belongs_to :user

  has_many_attached :images, dependent: :destroy
end
