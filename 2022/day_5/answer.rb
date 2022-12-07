def load_file(file_name)
  stacks = {}
  instructions = []
  File.read(file_name).split("\n").each_with_index do |line, line_num|
    if line.match?(/\[/)
      line_chars = line.each_char.to_a
      stack_level_values = (1..line_chars.length).step(4).map { |x| line[x] }
      stack_level_values.each_with_index do |supply, index|
        next if supply.strip.empty?

        stacks[index + 1] ||= []
        stacks[index + 1].unshift(supply)
      end
    elsif line.match?(/m/)
      instructions << line
    end
  end
  [stacks, instructions]
end

def part_one(problem)
  stacks = problem.first
  problem.last.each do |instruction|
    values = instruction.split(' ')
    values[1].to_i.times { stacks[values[5].to_i] << stacks[ values[3].to_i].pop }
  end
  stacks.keys.sort.map { |ind| stacks[ind].pop }.join
end

def part_two(problem)
  stacks = problem.first
  problem.last.each do |instruction|
    values = instruction.split(' ').each_slice(2).map(&:last).map(&:to_i)
    moved = stacks[values[1]].slice!(values[0] * -1..stacks[values[1]].length)
    stacks[values[2]] << moved
    stacks[values[2]].flatten!
  end
  stacks.keys.sort.map { |ind| stacks[ind].pop }.join
end

problem = load_file('input.txt')
puts part_one(problem)

problem = load_file('input.txt')
puts part_two(problem)
