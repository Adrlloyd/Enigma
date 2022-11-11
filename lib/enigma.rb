require 'date'
require_relative 'cipher'

class Enigma
  include Cipher

  def encrypt(message, key = rand_keys, date = the_date)
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