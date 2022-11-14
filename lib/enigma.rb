require 'date'
require_relative 'shift'
require_relative 'cypher'

class Enigma < Shift
  include Cypher

  def encrypt(message, key = rand_keys, date = today)
    message = message.downcase
    keys = the_keys(key)
    offsets = the_offsets(date)
    shifts = the_shifts(keys, offsets)
    { 
      encryption: code(message, shifts),
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = today)
    { 
      decryption: message.downcase,
      key: key,
      date: date
    }
  end

  def code(message, shifts)
    counter = 0
    output = ''
    message.chars.each do |character|
      if !characters.include?(character)
        output += character
      elsif counter == 0
        shifted_characters = characters.rotate(shifts[:A])
        index_position = characters.find_index(character)
        output += shifted_characters[index_position]
        counter += 1
      elsif counter == 1
        shifted_characters = characters.rotate(shifts[:B])
        index_position = characters.find_index(character)
        output += shifted_characters[index_position]
        counter += 1
      elsif counter == 2
        shifted_characters = characters.rotate(shifts[:C])
        index_position = characters.find_index(character)
        output += shifted_characters[index_position]
        counter += 1
      elsif counter == 3
        shifted_characters = characters.rotate(shifts[:D])
        index_position = characters.find_index(character)
        output += shifted_characters[index_position]
        counter = 0 
      end
    end 
    output
  end
end