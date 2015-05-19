require 'pry'
require 'date'


class CreditCard
  def initialize(name, number, cvv, expiration_date, zip_code)
    @name = name
    @number = number
    @cvv = cvv
    @expiration_date = expiration_date
    @zip_code = zip_code
  end

  attr_accessor :name, :zip_code

  # def zip_code_digits?
  #   @zip_code.to_s
  # end

  def valid?
    name_valid? && num_valid? && zip_valid? && exp_date_valid?
  end

  def name_valid?
    @name != nil || false
  end
  def num_valid?
    (@number.length == 16) ||false
  end

  def zip_valid?
    (@zip_code.length == 5) || false
  end


#this is not currently working, has to be fixed
  def exp_date_valid?
     if (@expiration_date.slice(2,2).to_i < Date.today.strftime("%y").to_i) || false
     elsif (@expiration_date.slice(2,2).to_i == Date.today.strftime("%y").to_i && @expiration_date.slice(0,2).to_i < Date.today.strftime("%m").to_i) || false
     end
  end


end

carta = CreditCard.new("me", "1234123412341234", "123", "0113", "12345")






binding.pry
