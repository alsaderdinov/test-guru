class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :img_url, :rule, presence: :true 

  enum rule: %i[success_backend_category success_first_try success_by_level]
end

