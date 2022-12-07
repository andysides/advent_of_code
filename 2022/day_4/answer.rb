def fully_contained_ranges(file_name)
  count = 0
  File.read(file_name).split("\n").each do |line|
    ranges = line.gsub(/(-|,)/, ' ').split.map(&:to_i).each_slice(2).to_a
    range1 = Range.new(ranges[0][0], ranges[0][1]).to_a
    range2 = Range.new(ranges[1][0], ranges[1][1]).to_a
    count += 1 if (range1 - range2).empty? || (range2 - range1).empty?
  end
  count
end

def overlapping_ranges(file_name)
  count = 0
  File.read(file_name).split("\n").each do |line|
    ranges = line.gsub(/(-|,)/, ' ').split.map(&:to_i).each_slice(2).to_a
    range1 = Range.new(ranges[0][0], ranges[0][1]).to_a
    range2 = Range.new(ranges[1][0], ranges[1][1]).to_a
    count += 1 if (range1 & range2).any?
  end
  count
end

puts fully_contained_ranges('input.txt')
puts overlapping_ranges('input.txt')
