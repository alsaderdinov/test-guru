class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :test_passages, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, :timer, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_create :set_timer_in_seconds

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :sort_by_category, lambda { |category|
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
  }

  def self.sort_by_category_array(category)
    sort_by_category(category).pluck(:title)
  end

  def total_questions
    questions.size
  end

  private

  def set_timer_in_seconds
    self.timer = timer * 60
  end
end
