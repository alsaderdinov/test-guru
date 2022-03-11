class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :img_url, :rule, :rule_param, presence: :true

  enum rule: %i[success_all_categories success_first_try success_by_level]
end
