class Room

  def initialize(arr)
    @direction_arr = arr
  end

  def has_entry?
    @direction_arr.include?('E')
  end

  def has_exit?
    @direction_arr.include?('X')
  end

  def to_h
    {north: @direction_arr[0], east: @direction_arr[1], south: @direction_arr[2], west: @direction_arr[3]}
  end

  def is_valid?
    count_directions == 4 && at_least_one_door?
  end

  private

  def at_least_one_door?
    @direction_arr.include?('*')
  end

  def count_directions
    @direction_arr.inject(0) { |counter, char|
      counter += 1 if char =~ /[EX*|]/
      counter
    }
  end

end