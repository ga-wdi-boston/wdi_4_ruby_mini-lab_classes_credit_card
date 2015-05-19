require 'pry'

class CreditCard
  def initialize(cc_number, expiry, ccv, name, zip)
    @cc_number = cc_number.to_s.gsub(/\s/, '')
    @expiry = expiry.to_s.gsub('/', '')
    @ccv = ccv.to_s
    @name =  name.to_s
    @zip = zip.to_s
  end

  def valid?


    date = Time.new
    ret = true

    if @cc_number.length != 16
      ret = false
    end

    if @expiry.slice(-2, 2).to_i < date.year-2000
      ret = false
    elsif @expiry.slice(-2, 2).to_i == date.year-2000 && @expiry.slice(2).to_i < date.month
      ret = false
    end

    (@ccv.length == 3)
    (@name.length > 0)
    (@zip.length == 5)
  end

  def card_type
    prefix = cc_number.slice(1).to_i
    case prefix
    when 3
     'American Express'
    when 4
     'Visa'
    when 5
      'Master Card'
    when 6
      'Discover'
    else
      'Unknown Card Type'
    end
  end

  def luhn
    evens = []
    odds = []
    @cc_number.reverse.each_char.each_with_index{|c, i|
      n = c.to_i
      if i.even?
        evens.push(n);
      else
        if n*2 > 9
          odds.push(n*2.to_s.each_chars.map {|c| c.to_i}.reduce(:+))
        else
          odds.push(n*2);
        end
      end
    }
    (evens + odds).inject{:+} % 10 == 0
  end


end

binding.pry


# 'American Express       34, 37            15
# 'Diners Club            300 to 305, 36    14
# 'Carte Blanche          38                14
# 'Discover               6011              16
# 'EnRoute                2014, 2149        15
# 'JCB                    3                 16
# 'JCB                    2131, 1800        15
# 'Master Card            51 to 55          16
# 'Visa                   4                 13, 16
#mycard = CreditCard.new("4242424242424242", "12/19", "333", "james", "02120")
