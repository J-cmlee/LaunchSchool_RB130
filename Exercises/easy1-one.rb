# def one?(collection)
#   collection.select { |item| yield(item) }.size == 1
# end

# def one?(collection, &block)
#   collection.select(&block).size == 1
# end

def one?(collection)
  found = []
  collection.each do |item|
    return false if yield(item) && !found.empty?

    found << item if yield(item)
  end
  !found.empty?
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false