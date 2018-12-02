
twos = 0
threes = 0
while (line = STDIN.gets) do
  line_values = line.strip.chars.map { |c| c.ord }.sort
  grouped_values = line_values.each_with_object({}) do |e,h|
    h[e] ||= 0
    h[e] += 1
  end
  twos += 1 if grouped_values.values.include?(2)
  threes += 1 if grouped_values.values.include?(3)
  if grouped_values.values.include?(4)
    puts line
  end
end
puts "#{twos}, #{threes}"
puts twos*threes
