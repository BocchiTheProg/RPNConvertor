result = []
stack = []
operators = [["+", "-"], ["x", "/"]]

ARGV.each do |i|
  unless operators[0].include? i or operators[1].include? i
    result.push i
  else
    operator_priority = 1
    if operators[1].include? i
      operator_priority = 2
    end
    stack_operator_priority = 1;
    loop do
      stack_operator_priority = 1;
      if operators[1].include? stack.last
        stack_operator_priority = 2
      end
      if !stack.empty? and stack_operator_priority >= operator_priority
        result.push stack.last
        stack.pop
      else
        break
      end
    end
    stack.push i
  end
end

loop do
  unless stack.empty?
    result.push stack.last
    stack.pop
  else
    break
  end
end
output = "output:"
result.each do |i|
  output += " " + i
end
puts output
