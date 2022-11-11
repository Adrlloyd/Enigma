require_relative 'cipher'

class Shift
  include Cipher

  def the_keys
    the_keys = Hash.new
    the_keys[:A] = rand_keys[0..1]
    the_keys[:B] = rand_keys[1..2]
    the_keys[:C] = rand_keys[2..3]
    the_keys[:D] = rand_keys[3..4]
    the_keys
  end
end