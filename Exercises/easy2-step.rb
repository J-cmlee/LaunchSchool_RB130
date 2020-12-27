def step(start, stop, incr)
  counter = start
  while counter < stop
    yield(counter)
    counter += incr
  end
  yield(stop) if counter >= stop
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
