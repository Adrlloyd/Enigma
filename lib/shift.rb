require_relative 'cypher'

class Shift
  include Cypher

  def the_keys(key)
    the_keys = Hash.new
    the_keys[:A] = key[0..1]
    the_keys[:B] = key[1..2]
    the_keys[:C] = key[2..3]
    the_keys[:D] = key[3..4]
    the_keys
  end

  #offsets

  def date_squared
    (today.to_i ** 2).to_s
  end

  def offset_amount
    date_squared[-4..-1]
  end

  def the_offsets(date)
    the_offset = Hash.new
    the_offset[:A] = offset_amount[0]
    the_offset[:B] = offset_amount[1]
    the_offset[:C] = offset_amount[2]
    the_offset[:D] = offset_amount[3]
    the_offset
  end

  #combined 

  def the_shifts(keys, offsets)
    shifts = Hash.new
    shifts[:A] = (the_keys[:A].to_i + the_offset[:A].to_i)
    shifts[:B] = (the_keys[:B].to_i + the_offset[:B].to_i)
    shifts[:C] = (the_keys[:C].to_i + the_offset[:C].to_i)
    shifts[:D] = (the_keys[:D].to_i + the_offset[:D].to_i)
    shifts
  end
end