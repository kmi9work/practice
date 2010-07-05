def close?(a, b)
  puts "ERROR" if a[2] == 0
  b[2] == 0 and Math.sqrt((b[0] - a[0])**2 + (b[1] - a[1])**2) <= @l
end

def solve(arr, cur, way)
  return [1, way] if arr[cur][1] >= @n
  arr.each_index do |i|
    if close?(arr[cur], arr[i])
      arr[i][2] = 1
      a, b = *solve(arr, i, way + [i])
      if a == 1
        @ways << b.dup
      end
    end
  end
  return [0, way]
end

@ways = []
@l, @n, @k = *gets.split(" ").map{|i| i.to_i }
arr = [[0,0,1]]
#@n.times{|i| arr << [i+1,0,0]}
@k.times do 
  arr << gets.split(" ").map{|i| i.to_i} + [0]
end
arr.sort!{|a,b| a[1] <=> b[1]}
p arr
puts "==="
solve(arr, 0, [0])

if @ways.size > 0
  p @ways
else
  puts "NO"
end
