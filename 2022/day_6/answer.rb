def part_one(file_name)
  buffer = File.read(file_name).split("\n").first
  (0..buffer.length - 3).detect do |offset|
    buffer[0 + offset..3 + offset].each_char.to_a.uniq.count == 4
  end + 4
end

def part_two(file_name)
  buffer = File.read(file_name).split("\n").first
  (0..buffer.length - 13).detect do |offset|
    buffer[0 + offset..13 + offset].each_char.to_a.uniq.count == 14
  end + 14
end

puts part_one('input.txt')
puts part_two('input.txt')
