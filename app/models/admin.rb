class Admin < User
  validates :surname, presence: true
end
