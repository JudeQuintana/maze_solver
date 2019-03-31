require_relative './maze'
require_relative './room'

def output_file(str)
  puts
  puts "Valid input has been received and is as follows:"
  puts "-" * 50
  puts str
  puts "-" * 50
  puts "The maze will now be tested for validity."
end

file_name = 'data-1.txt'
file = File.read(file_name)

output_file(file)

parsed_maze_arr = file.split(/\n/)
maze = Maze.new(parsed_maze_arr)
maze.is_valid?