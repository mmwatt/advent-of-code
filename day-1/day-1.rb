# https://adventofcode.com/2022/day/1

food_list = File.read('./day-1.txt').split(/\n/)
elves = {}
elf_no = 0

food_list.each do |food_item|
    # puts food_item
    if food_item == ""
        elf_no += 1
    elsif elves[elf_no].nil?
        elves[elf_no] = food_item.to_i
    else
        elves[elf_no] += food_item.to_i
    end
    # puts elves
end

puts elves.values.max