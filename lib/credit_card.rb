require 'pry'
class CreditCard
  def initialize(card_number, expiration_date, ccv, name, zip_code)
    @card_number = card_number.to_s.gsub(/\s+/, '')
    @expiration_date = expiration_date.to_s.gsub('/', '')
    @ccv = ccv.to_s
    @name = name.to_s
    @zip_code = zip_code.to_s
  end

  def valid?
    date = Time.new
    ret = true
    if @card_number.length != 16
      ret = false
      puts "card length"
    end

    if (@expiration_date.slice(-2,2).to_i < (date.year - 2000))
      ret = false
      puts "exp year"
    elsif (@expiration_date.slice(2).to_i < date.month) and @expiration_date.slice(-2,2).to_i == (date.year - 2000)
      ret = false
      puts "exp month"
      puts @expiration_date.slice(2).to_i
      puts date.month
    end

    if @ccv.length != 3
      ret = false
      puts 'ccv'
    end

    if @name.length < 1
      ret = false
      puts 'name length'
    end
    if @zip_code.length != 5
      ret = false
      puts 'zip code'
    end
    ret
  end

  def card_type
    case card_number.slice(1).to_i
    when 3
      'American Express'
    when 4
      'Visa'
    when 5
      'MasterCard'
    when 6
      'Discover'
    else
      'Unknown card type.'
    end
  end

  def passes_luhn?
    evens = []
    odds = []
    @card_number.reverse.each_char.each_with_index{|c, i|
      num = c.to_i
      if i.even?
        evens.push(num)
      else
        if (num * 2) > 9
          odds.push((num * 2).to_s.each_char.map {|c| c.to_i }.reduce(:+))
        else
          odds.push(num * 2)
        end
      end
    }
    (evens+odds).inject(:+) % 10 == 0
  end
end

binding.pry

# American Express       34, 37            15
# 'Discover               6011              16
# 'Master Card            51 to 55          16
# 'Visa                   4                 13, 16
