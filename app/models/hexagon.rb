class Hexagon < ApplicationRecord
  belongs_to :game
  belongs_to :user, optional: true

  validates :x, :y, :z, presence: true
  validates :game, uniqueness: { scope: [:x, :y, :z] }
  validate :validate_coords
  validate :validate_distance_form_center

  before_validation :init_z_if_empty

  private

  def init_z_if_empty
    return if x.blank? || y.blank?
    self.z ||= 0 - x - y
  end

  def validate_coords
    return if x.blank? || y.blank? || z.blank?
    errors.add(:base, 'x + y + z must equal 0') if (x + y + z).nonzero?
  end

  def validate_distance_form_center
    errors.add(:base, :not_in_the_board) if ((x.abs + y.abs + z.abs) / 2) > game.board_size
  end
end
