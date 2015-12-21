require 'pry'

class CreditCard
  attr_reader :card_type
  attr_accessor
  def initialize(name, card_num, x_month, x_year, ccv, zip, card_type)
    @name = name
    @card_num = card_num
    @x_month = x_month
    @x_year = x_year
    @ccv = ccv
    @zip = zip
    @card_type = card_type

  end

  def time?
    time = Time.new
    # if expo year == current year then compare expo month to current month and return true if expo month is greater than current month
    if @x_year >= time.year.to_s[2,4].to_i then
      @x_month >= time.month
    #if expo year is greater than current year return true
    else
      @x_year > time.year.to_s[2,4].to_i
    end
  end

  def valid?
    @name && @zip.length == 5 && @card_num.length == 16 && time?
    end

end

binding.pry
