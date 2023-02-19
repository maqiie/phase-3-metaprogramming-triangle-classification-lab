class Triangle
  class TriangleError < StandardError; end

  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    validate_triangle
  end

  def kind
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    if [a, b, c].any? { |side| side <= 0 } || a + b <= c || b + c <= a || a + c <= b
      raise TriangleError
    end
  end
end
