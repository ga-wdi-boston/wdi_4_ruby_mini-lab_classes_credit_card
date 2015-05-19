require 'date'
require 'pry'

today = Date.today
today_year = today.year - 2000
today_month = today.month

class CreditCard
  def initialize(cc_num, exp_date, ccv_num, name, billing_zip)
    @cc_num = cc_num
    @exp_date = exp_date
    # Date.strptime(exp_date, %m%Y)
    @ccv_num = ccv_num
    @name = name
    @billing_zip = billing_zip
  end

  attr_accessor :cc_num, :exp_date, :ccv_num, :name, :billing_zip

  def valid?
    if !name
      puts "You need to have a name"
      false
    elsif billing_zip.length != 5
      puts "You need to enter a valid billing zip code"
      false
    elsif cc_num.length != 16 || cc_num.match(/\D+/)
      puts "Please enter a valid credit card number"
      false
    elsif @exp_date.split('/').at(1).to_i + 2000 < Date.today.year
      puts "Year earlier than current year"
      false
    elsif @exp_date.split('/').at(1).to_i + 2000 == Date.today.year && @exp_date.split('/').at(0).to_i < Date.today.month
      puts "Year is fine, month is expired"
      false
    else
      true
    end

    def card_type
      if cc_num.match(/ |  5[1-5][0-9]{14} /)
        "MasterCard"
      elsif cc_num.match(/ |  3[47][0-9]{13} /)
        "American Express"
      elsif cc_num.match(/ |  6(?:011|5[0-9]{2})[0-9]{12} /)
        "Discover"
      elsif cc_num.match(/  /)
        "Visa"
      else
        "Other"
    end

end

my_credit_card = CreditCard.new("1234567898765432", "05/17", "982", "Amy Goldberg", "02127")

binding.pry

# The CreditCard class should have the following attributes:

# Credit card # (16-digits)
# Expiration Date (two digit month, two digit year)
# CCV (3 digit number on the back)
# Name
# Billing Zip Code (5-digits)

# It should have the following methods:

# initialize - Used for creating a new credit card.
# valid? - This checks the validity of the credit card. Check that it has a name, proper length zip code, 16-digit number and an expiration date in the future.
# Write a card_type method that will return Visa, MasterCard, Discover, American Express or Other
