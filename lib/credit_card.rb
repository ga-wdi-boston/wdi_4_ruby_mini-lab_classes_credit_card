require 'date'
require 'pry'

# make a credit card
class CreditCard
  def initialize(cc_num, exp_date, ccv_num, name, billing_zip)
    @cc_num = cc_num
    @exp_date = exp_date
    @ccv_num = ccv_num
    @name = name
    @billing_zip = billing_zip
  end

  attr_accessor :name, :billing_zip, :cc_num, :exp_date

  # valid? - This checks the validity of the credit card. Check that it has a name, proper length zip code, 16-digit number and an expiration date in the future.
  def valid?
    if !name
      puts 'You need to have a name!'
      false
    elsif billing_zip.length != 5
      puts 'You need to enter a valid billing zip!'
      false
    elsif cc_num.length != 16 || cc_num.match(/\D+/)
      puts 'Please enter a valid credit card number'
      false
    elsif @exp_date.split('/').at(1).to_i + 2000 < Date.today.year
      puts 'too early year'
      false
    elsif @exp_date.split('/').at(1).to_i + 2000 == Date.today.year && @exp_date.split('/').at(0).to_i < Date.today.month
      puts 'SAme year, too early month'
      false
    else
      true
    end
  end

  def card_type
    if cc_num.match(/ |5[1-5][0-9]{14}/)
      'Master Card'
    elsif cc_num.match(/^(?:4[0-9]{12})(?:[0-9]{3})?/)
      'Visa'
    elsif cc_num.match(/ |  3[47][0-9]{13}     /)
      'Amex'
    elsif cc_num.match(/ |  6(?:011|5[0-9]{2})[0-9]{12}/)
      'Discover'
    else
      'Other'
    end
  end
end

my_credit_card = CreditCard.new '5527304930339284', '04/15', '374', 'Andrew Johnson', '39930'

binding.pry
