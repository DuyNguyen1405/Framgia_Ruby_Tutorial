class Micropost < ApplicationRecord

  belongs_to :user
  scope :newest_first, -> {order created_at: :desc}
  validates :user, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.content_max_length}

end
