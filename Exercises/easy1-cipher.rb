INPUT = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.freeze
OUTPUT = 'NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm'.freeze

def create_cipher
  cipher = {}
  0.upto(INPUT.size - 1) do |idx|
    cipher[INPUT[idx]] = OUTPUT[idx]
  end
  cipher
end

def decode(names)
  cipher = create_cipher
  names.map do |name|
    decoded_name = ''
    0.upto(name.size - 1) do |idx|
      decoded_name << if name[idx] =~ /[a-zA-Z]/
                        cipher[name[idx]]
                      else
                        name[idx]
                      end
    end
    decoded_name
  end
end

file = File.open('names.txt')
file_data = file.readlines.map(&:chomp)
p decode(file_data)
file.close
