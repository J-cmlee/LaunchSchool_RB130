class TextAnalyzer
  def process
    file = File.new('sample.txt')
    puts yield(file)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| (file.read.scan("\n\n").count + 1).to_s + ' paragraphs' }
analyzer.process { |file| file.readlines.map(&:chomp).count.to_s + ' lines' }
analyzer.process { |file| file.read.split(' ').count.to_s + ' words' }

# Given solution
class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }