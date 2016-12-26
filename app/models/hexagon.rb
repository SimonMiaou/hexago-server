class Hexagon < ApplicationRecord
  belongs_to :game
  belongs_to :user, optional: true

  validates :x, :y, :z, presence: true
  validate :validate_coords

  before_validation :init_z_if_empty

  private

  def init_z_if_empty
    return if z.present?
    return if x.blank? || y.blank?
    self.z = 0 - x - y
  end

  def validate_coords
    return if x.blank? || y.blank? || z.blank?
    errors.add(:base, 'x + y + z must equal 0') if (x + y + z).nonzero?
  end
end
