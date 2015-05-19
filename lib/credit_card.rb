require 'pry'
class CreditCard
attr_reader :card_type
attr_accessor :zip , :name
  def initialize(name, cc_number, exp_month, exp_year, ccv, zip, card_type)
    @name = name
    @cc_number = cc_number
    @exp_month = exp_month
    @exp_year = exp_year
    @ccv = ccv
    @zip = zip
    @card_type = card_type
  end
  def time?
    #Time.new gives us the current date and then we store it in variable time
    time= Time.new
    # if exp_year equals current year then we need to cheeck to see if the exp_month is greter or  is the current month
    if @exp_year == time.year.to_s[2,4].to_i then
      @exp_month >= time.month
    #but if the exp_year is greater than the current year then we dont havve to check the month
    else @exp_year > time.year.to_s[2,4].to_i
    end
 end

  def valid?
    @name && @cc_number.length == 16 && @zip.length ==5 && time?
  end

  #def card_type?
  #  if @cc_number[0] == "4" then
  #    puts "visa"
  #  elsif @cc_number[5]

  #end
end

binding.pry

