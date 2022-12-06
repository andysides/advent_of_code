def highest_calorie_count(file_name)
  elf_calories = []
  highest = 0

  File.read(file_name).split("\n").each do |line|
    if line.empty?
      total_elf_calories = elf_calories.sum
      elf_calories = []
      highest = total_elf_calories if total_elf_calories > highest
    else
      elf_calories << line.to_i
    end
  end
  highest
end

def highest_calorie_counts(file_name)
  elf_calories = []
  highest3 = [0, 0, 0]

  File.read(file_name).split("\n").each do |line|
    if line.empty?
      total_elf_calories = elf_calories.sum
      elf_calories = []

      if highest3.last < total_elf_calories
        highest3 << total_elf_calories
        highest3 = highest3.sort.reverse[0..2]
      end
    else
      elf_calories << line.to_i
    end
  end
  highest3.sum
end

puts highest_calorie_count('day_1/input.txt')
puts highest_calorie_counts('day_1/input.txt')
