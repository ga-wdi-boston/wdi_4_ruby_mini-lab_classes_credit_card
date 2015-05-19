require 'pry'

class CreditCard
  attr_writer :name
  attr_writer :zip

  def initialize(num,expire,ccv,name,zip)
    @number = num
    @expire = expire
    @ccv = ccv
    @name = name
    @zip = zip
  end

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
    expire >= date.today
  end

  def valid?
    zip_valid? && ccv_valid? && number_valid? && name_valid? && expire_valid?
  end

  def card_type
    length = @number.size
    if length == 15 && @number =~ /^(34|37)/
      "AMEX"
    elsif length == 16 && @number =~ /^6011/
      "Discover"
    elsif length == 16 && @number =~ /^5[1-5]/
      "MasterCard"
    elsif (length == 16) && @number =~ /^4/
      "Visa"
    else
      "Unknown"
    end
  end
end

card = CreditCard.new(1234123412341234,"1220","123","Bob","02114")

binding.pry
