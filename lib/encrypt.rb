require_relative 'enigma'

enigma = Enigma.new
handle = File.open(ARGV[0], 'r')

incoming_text = handle.read
handle.close

encrypted = enigma.encrypt(incoming_text)

writer = File.open(ARGV[1], 'w')
writer.write(encrypted[:encryption])
writer.close

puts "Created '#{ARGV[1]}' with the key #{encrypted[:key]} and the date #{encrypted[:date]}"