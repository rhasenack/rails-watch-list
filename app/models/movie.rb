class Movie < ApplicationRecord

  has_many :bookmarks
  before_destroy :prevent_destroy

  validates :title, :overview, presence: true, allow_blank: false
  # validates :rating, numericality: {greater_tha_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :title, uniqueness: true

  private

  def prevent_destroy
    if self.bookmarks.count > 0
      self.errors[:base] << "You may not delete this child."
      return false
    end
  end
end
