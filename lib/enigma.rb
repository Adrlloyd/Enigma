require 'date'
require_relative 'cipher'

class Enigma
  include Cipher

  def encrypt(message, key = rand_keys, date = the_date)
  end

  def decrypt
  end

end