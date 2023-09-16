result = "output:"
stack = []
operators = [["+", "-"], ["x", "/"]]
parenthesis = ["(", ")"]

ARGV.each do |i|
  unless operators[0].include? i or operators[1].include? i or parenthesis.include? i
    result += " " + i
  else 
    if operators[0].include? i or operators[1].include? i
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
        if !stack.empty? and !parenthesis.include? stack.last and stack_operator_priority >= operator_priority
          result += " " + stack.last
          stack.pop
        else
          break
        end
      end
      stack.push i
    elsif i == parenthesis[0]
      stack.push i
    else 
      loop do
        unless stack.last == parenthesis[0]
          result += " " + stack.last
          stack.pop
        else
          stack.pop
          break
        end
      end
    end
  end
end

loop do
  unless stack.empty?
    result += " " + stack.last
    stack.pop
  else
    break
  end
end
puts result
