class PigLatin2
  FRONTREGEX = /^[^aeiou]*/.freeze

  def self.translate(text)
    text.split(' ').map do |word|
      new.translate(word)
    end.join(' ')
  end

  def translate(word)
    front = word.scan(FRONTREGEX).first
    pairs = word[0..1]
    if %w[xr yt].include?(pairs)
      word + 'ay'
    elsif pairs == 'qu'
      word[2..-1] + 'quay'
    elsif word[1..2] == 'qu' && word[0] =~ /[^aeiou]/
      word[3..-1] + word[0] + 'quay'
    else
      word[front.size..-1] + front + 'ay'
    end
  end
end

class PigLatin
  def self.translate(phrase)
    phrase.split(' ').map do |word|
      translate_word(word)
    end.join(' ')
  end

  def self.translate_word(word)
    if begins_with_vowel_sound?(word)
      word + 'ay'
    else
      consonant_sound, the_rest_of_word = parse_for_consonant(word)
      the_rest_of_word + consonant_sound + 'ay'
    end
  end

  def self.begins_with_vowel_sound?(word)
    word.match(/\A[aeiou]|[xy][^aeiou]/)
  end

  def self.parse_for_consonant(word)
    consonant_split = /\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/.match(word)
    [consonant_split[1], consonant_split[2]]
  end
end

class PigLatin3
  def self.translate(string)
    string.split(" ").each do |word|
      if word.scan(/^[aeiou]|^(y|x)[^aeiou]+/).empty?
        word << word.slice!(/^[^aeiouq]*(qu)*/)
      end
      word << "ay"
    end
    .join(" ")
  end
end