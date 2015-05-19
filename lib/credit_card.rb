require 'pry'

class CreditCard
  include Math
  attr_reader :card_type
  attr_accessor :name, :zip
  def initialize(name,card_type,card_num,x_month,x_year,ccv,zip)
    @name = name
    @card_type = card_type
    @card_num = card_num
    @x_month = x_month
    @x_year = x_year
    @ccv = ccv
    @zip = zip

  end

  def time?
    time = Time.new
    #if expo year == current year then compare expo month to current month and return true if expo month is greater than current month
    if @x_year == time.year.to_s[2,4].to_i then
      @x_month >= time.month
    #if expo year is greater than current year return true
    else
      @x_year > time.year.to_s[2,4].to_i
    end
  end

  def valid?
    @name && @zip.length == 5 && @card_num.length == 16 && time?
  end

  def luhn?
    arr = @card_num.chars.map{|c| c.to_i}.reverse
    checkSum = arr.shift
    checkD = 10 - (arr.map.with_index{|n, i| i%2==0? n*2 : n}.map{|n| sum_d(n)}.reduce(:+)*9)%10
    checkD == @card_num[(@card_num.length)-1].to_i
  end

  def sum_d(num)
    num.to_s.chars.map{|c| c.to_i}.reduce(:+)
  end

end

aaron = CreditCard.new("aaron","visa","4223457648120189",05,16,234,"02458")


binding.pry
