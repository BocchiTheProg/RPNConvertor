result = "output:"
stack = []
operators = [["+", "-"], ["*", "x", "/"]]
parenthesis = ["(", ")"]

ARGV.each do |i|
  #Finding operands
  if !operators[0].include? i and !operators[1].include? i and !parenthesis.include? i
    result += " " + i
  #Finding operators
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
  #Finding parenthesis
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

#Empting the stack to the output
loop do
  if !stack.empty?
    result += " " + stack.last
    stack.pop
  else
    break
  end
end

printf "input:"
ARGV.each{ |i| printf " " + i }
puts "\n" + result

#Text with tips about inputting some math signs
puts "P.S. If your input looks exactly as output, try using spacebars between operands and operators."
puts "If your input doesn`t look the same as you type it and you were using * sign, try using x or \"*\" to input multiplication sign."
puts "P.P.S. If you want to use parenthesis in your input, use \"(\" and \")\""

