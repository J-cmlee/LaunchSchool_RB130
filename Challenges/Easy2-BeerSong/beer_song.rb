class BeerSong
  def refrain(qty)
    "#{qty} bottles of beer on the wall, #{qty} bottles of beer.\n" \
    "Take one down and pass it around, #{qty - 1} bottles of beer on the wall.\n"
  end

  def almostlastbottle
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def lastbottle
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def lastline
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def verse(amount)
    case amount
    when 0 then lastline
    when 1 then lastbottle
    when 2 then almostlastbottle
    else refrain(amount)
    end
  end

  def verses(start, stop)
    output = ''
    start.downto(stop) do |index| 
      output << verse(index)
      output << "\n" if index != stop
    end
    output
  end

  def lyrics
    verses(99, 0)
  end
end

# puts BeerSong.new.verse(0)
# puts BeerSong.new.verses(2, 0)
