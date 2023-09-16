result = "output:"
stack = []
operators = [["+", "-"], ["*", "x", "/"]]
parenthesis = ["(", ")"]

ARGV.each do |i|
  if !operators[0].include? i and !operators[1].include? i and !parenthesis.include? i
    result += " " + i
  elsif operators[0].include? i or operators[1].include? i
    operator_priority = 
      if operators[0].include? i
        1
      else
        2
      end
    loop do
      stack_operator_priority = 
        if operators[0].include? stack.last
          1
        else 
          2
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
      if stack.last != parenthesis[0]
        result += " " + stack.last
        stack.pop
      else
        stack.pop
        break
      end
    end
  end
end

loop do
  if !stack.empty?
    result += " " + stack.last
    stack.pop
  else
    break
  end
end

puts result
