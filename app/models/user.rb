class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  has_many :test_passages, dependent: :destroy
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
  has_many :tests, through: :test_passages

  has_secure_password
  validates :name, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX },
    uniqueness: true

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end

