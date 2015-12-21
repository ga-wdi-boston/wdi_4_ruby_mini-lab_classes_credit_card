require "pry"

class CreditCard
  def initialize(number, expire, ccv, name, zip)
    @number = number
    @expire = expire
    @ccv = ccv
    @name = name
    @zip = zip
  end

  #This makes the attribute writable but not readable
  attr_writer :name
  attr_writer :zip

  def zip_valid?
    zip.length == 5
  end

  def ccv_valid?
    ccv.length == 3
  end

  def number_valid?
    number.length == 15 || 16
  end

  def name_valid?
    name == " "
  end

  def expire_valid?
    expire >= Date.today
  end

  def valid?
    zip_valid? && ccv_valid? && number_valid? && name_valid? && expire_valid?
  end

  # check specified conditions to determine the type of card
  def card_type
    length = @number.size
    if length == 15 && @number =~ /^(34|37)/ #~ means within
      "AMEX"
    elsif length == 16 && @number =~ /^6011/
      "Discover"
    elsif length == 16 && @number =~ /^5[1-5]/
      "MasterCard"
    elsif length == 16 && @number =~ /^4/
      "Visa"
    else
      "Unknown"
  end
  end
end


card = CreditCard.new(1234123412341234, "1213", 333, 'Bob', "22478")

binding.pry

