#!/usr/bin/ruby
j=15.0
k=(j+13)/27
loop do
    k=k+1.2
    i=3*k-1
    puts "i = #{i}"
    puts "k = #{k}"
    puts "j = #{j}"
    if k>10
        break
    end
end

