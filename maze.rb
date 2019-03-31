class Maze
  attr_reader :maze

  def initialize(parsed_maze_arr)
    @parsed_maze_arr = parsed_maze_arr
    build_maze
  end

  def is_valid?
    is_maze_valid = true

    puts
    puts "Test 1: Are all the rooms valid?"

    if rooms_valid?
      puts "All rooms are valid"
    else
      puts "Not all rooms are valid"
      is_maze_valid = false
    end

    entry_exit_rooms = entry_and_exit_rooms

    puts
    puts "Test 2: Are there entry points and are they valid?"

    if entry_exit_rooms[0][:valid_entry].empty?
      puts "There are no entry points"
      is_maze_valid = false
    end

    entry_exit_rooms[0][:valid_entry].each { |room_number|
      puts "There is an entry in room: #{room_number} and it is valid."
    }

    entry_exit_rooms[2][:invalid_entry].each { |room_number|
      puts "There is an entry in room: #{room_number} and it is NOT valid."
      is_maze_valid = false
    }

    puts
    puts "Test 3: Are there entry points and are they valid?"

    if entry_exit_rooms[1][:valid_exit].empty?
      puts "There are no exit points"
      is_maze_valid = false
    end

    entry_exit_rooms[1][:valid_exit].each { |room_number|
      puts "There is an exit in room: #{room_number} and it is valid."
    }

    entry_exit_rooms[3][:invalid_exit].each { |room_number|
      puts "There is an exit in room: #{room_number} and it is NOT valid."
      is_maze_valid = false
    }

    puts
    puts "Test 4: Is the parameter valid?"

    if is_parimeter_valid?
      puts "Yes, the perimeter is valid."
    else
      puts "No, the perimeter is NOT valid."
      is_maze_valid = false
    end

    puts
    puts "-" * 50
    puts (is_maze_valid ? "Maze is valid." : "Maze is NOT valid")
    puts "-" * 50

  end

  private

  def entry_and_exit_rooms
    valid_entry = []
    valid_exit = []
    invalid_entry = []
    invalid_exit = []
    count = 0

    @maze.each { |row|
      row.each_with_index { |room, index|

        room_number = (count + index + 1)

        if room.has_entry?
          if is_on_perimeter?(room)
            valid_entry << room_number
          else
            invalid_entry << room_number
          end
        end

        if room.has_exit?
          if is_on_perimeter?(room)
            valid_exit << room_number
          else
            invalid_exit << room_number
          end
        end
      }
      count += row.size
    }

    [{valid_entry: valid_entry}, {valid_exit: valid_exit}, {invalid_entry: invalid_entry}, {invalid_exit: invalid_exit}]
  end

  def is_parimeter_valid?

    wall = '|'

    top = top_row.map { |room|
      room.to_h[:north]
    }.uniq.reject { |char| char =~ /[EX]/ }

    return false unless top.include?(wall) && top.length == 1

    bottom = bottom_row.map { |room|
      room.to_h[:south]
    }.uniq.reject { |char| char =~ /[EX]/ }

    return false unless bottom.include?(wall) && bottom.length == 1

    right = right_col.map { |room|
      room.to_h[:east]
    }.uniq.reject { |char| char =~ /[EX]/ }

    return false unless right.include?(wall) && right.length == 1

    left = left_col.map { |room|
      room.to_h[:west]
    }.uniq.reject { |char| char =~ /[EX]/ }

    return false unless left.include?(wall) && left.length == 1

    true

  end

  def is_on_perimeter?(room)
    perimeter.include?(room)
  end

  def perimeter
    top_row + right_col + bottom_row + left_col
  end

  def top_row
    @maze.first
  end

  def bottom_row
    @maze.last
  end

  def right_col
    @maze.map { |row| row[-1] }
  end

  def left_col
    @maze.map { |row| row[0] }
  end

  def rooms_valid?
    check_for_invalid_rooms.empty? ? true : false
  end

  def check_for_invalid_rooms
    @maze.each_with_object([]) { |row, invalid_rooms| row.each { |room| invalid_rooms << room unless room.is_valid? } }
  end

  def build_maze #build maze with room objects
    @maze = @parsed_maze_arr.each_with_object([]) { |row, new_maze|
      new_maze << row.split(/\s+/).each_with_object([]) { |room, new_row|
        new_row << Room.new($1.split(//)) if room =~ /\[(.*)\]/ }
    }
  end

end
