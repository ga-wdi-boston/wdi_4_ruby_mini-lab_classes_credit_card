require 'pry'

class CreditCard
  attr_accessor :name, :billing_zip #input must be as a string to accomodate octal errors
  def initialize(num, expiration_date, ccv)
    @num = num
    @expiration_date = expiration_date
    @ccv = ccv
  end


  def valid?
    if @name == name && @billing_zip.to_s.length == 5 && @num.to_s.length == 16 && @expiration_date.slice(0..2) > "05" && @expiration_date.slice(1..3) > "15"
    end
    true
  end

  def card_type
    "MasterCard"
  end


  def luhn?
    arr_with_check_num = @num.chars
    array = arr_with_check_num.to_i.pop

    even_arr = array.map.with_index { |e| e % 2 == 0}
    odd_arr = array.map.with_index { |e| e % 2 == 1}

  end


end

binding.pry
