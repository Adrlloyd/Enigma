require 'date'
require_relative 'shift'
require_relative 'cypher'

class Enigma
  include Cypher

  def encrypt(message, key = rand_keys, date = the_date)
    keys = the_keys(key)
    offsets = the_offsets(date)
    shifts = the_shifts(keys, offsets)
    { 
      encryption: message.downcase,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = the_date)
    { 
      decryption: message.downcase,
      key: key,
      date: date
    }
  end

end