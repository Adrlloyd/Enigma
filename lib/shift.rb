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

  #offsets

  def date_squared
    (the_date.to_i ** 2).to_s
  end

  def offset_amount
    date_squared[-4..-1]
  end

  def the_offset
    the_offset = Hash.new
    the_offset[:A] = offset_amount[0]
    the_offset[:B] = offset_amount[1]
    the_offset[:C] = offset_amount[2]
    the_offset[:D] = offset_amount[3]
    the_offset
  end
end