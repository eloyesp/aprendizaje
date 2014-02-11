require 'minitest/autorun'

class TestSkyscrapers < Minitest::Unit::TestCase

  def test_simple
    input = [ 5, 9, 8, 7, 8, 9, 5, 6]
    assert_equal 5, Skyscrapers.new(input).sum
  end

  def test_complex
    input = [ 1, 2, 5, 9, 8, 7, 8, 9, 5, 6, 2, 1]
    assert_equal 5, Skyscrapers.new(input).sum
  end
end

# Solves the problem with un vector on each side, they will walk the buildings
# in turns.
class Skyscrapers

  # store the height array
  attr_reader :heights

  # the size of the skycrappers vector.
  attr_reader :size

  # set innitial values
  def initialize heights
    @heights = heights
    @size    = heights.size
    @water   = 0
    @left    = 0
    @right   = heights.size - 1
  end

  # walk all the buildings taking the turn on the side that is below
  def sum
    until complete? do
      if heights[@left] <= heights[@right]
        advance_left
      else
        advance_right
      end
    end
    @water
  end

  private

  # the walking is complete when they have walked all the buildings
  def complete?
    @left >= @right
  end

  def advance_left
    current_top = heights[@left]
    begin
      next_height = heights[@left + 1]
      if next_height < current_top
        @water += current_top - next_height
      end
      @left += 1
    end until next_height > current_top || complete?
  end

  def advance_right
    current_top = heights[@right]
    begin
      next_height = heights[@right - 1]
      if next_height < current_top
        @water += current_top - next_height
      end
      @right -= 1
    end until next_height > current_top || complete?
  end

end

def skyscrapers(heights)
  puts Skyscrapers.new(heights).sum
end
