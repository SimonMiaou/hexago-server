require 'test_helper'

class HexagonTest < ActiveSupport::TestCase
  test 'validate coordinates' do
    assert build(:hexagon, x: 0, y: 0, z: 0).valid?
    refute build(:hexagon, x: 0, y: 1, z: 0).valid?
  end
end
