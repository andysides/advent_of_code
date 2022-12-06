def rucksack_shared_item_totals(file_name)
  priorities = ('a'..'z').to_a + ('A'..'Z').to_a
  File.read(file_name).split("\n").sum do |line|
    items = line.each_char.to_a
    r1 = items[0...items.count / 2]
    r2 = items[items.count / 2...items.count]
    priorities.index((r1 & r2).first) + 1
  end
end

def group_badge_totals(file_name)
  priorities = ('a'..'z').to_a + ('A'..'Z').to_a
  lines = File.read(file_name).split("\n")
  lines.each_slice(3).sum do |group|
    char = group.map { |g| g.each_char.to_a }.reduce(&:&).first
    priorities.index(char) + 1
  end
end

puts rucksack_shared_item_totals('input.txt')
puts group_badge_totals('input.txt')
