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

  def decrypt
  end

end