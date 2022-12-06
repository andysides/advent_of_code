require 'pry'
def follow_guide_exactly(file_name)
  selection_points = { 'X' => 1, 'Y' => 2, 'Z' => 3 }
  outcome_points = {
    'A' => { 'X' => 3, 'Y' => 6, 'Z' => 0 },
    'B' => { 'X' => 0, 'Y' => 3, 'Z' => 6 },
    'C' => { 'X' => 6, 'Y' => 0, 'Z' => 3 }
  }
  File.read(file_name).split("\n").sum do |line|
    choices = line.split(' ')
    selection_points[choices[1]] + outcome_points[choices[0]][choices[1]]
  end
end

def follow_guide_correctly(file_name)
  selection_points = { 'X' => 1, 'Y' => 2, 'Z' => 3 }
  result_points = { 'X' => 0, 'Y' => 3, 'Z' => 6 }
  outcome_points = {
    'A' => { 0 => 'Z', 3 => 'X', 6 => 'Y'},
    'B' => { 0 => 'X', 3 => 'Y', 6 => 'Z'},
    'C' => { 0 => 'Y', 3 => 'Z', 6 => 'X'}
  }
  File.read(file_name).split("\n").sum do |line|
    choices = line.split(' ')
    result = result_points[choices.last]
    result + selection_points[outcome_points[choices.first][result]]
  end
end

puts follow_guide_exactly('input.txt')
puts follow_guide_correctly('input.txt')
