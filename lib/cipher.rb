require 'date'

module Cipher

  def rand_keys
    rand.to_s[2..7]
  end

  def the_date
    Date.today.strftime("%d%m%y")
  end

  def characters
    ("a".."z").to_a << " "
  end
  
end