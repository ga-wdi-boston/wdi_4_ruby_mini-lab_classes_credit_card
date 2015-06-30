
# Write a class to describe a `CreditCard`.

# The `CreditCard` class should have the following attributes:

# - Credit card # (16-digits)

# > Note: Do *not* check a real credit card number into version control.

# - Expiration Date (two digit month, two digit year)
# - CCV (3 digit number on the back)
# - Name
# - Billing Zip Code (5-digits)

# It should have the following methods:

# - `initialize` - Used for creating a new credit card.
# - `valid?` - This checks the validity of the credit card. Check that it has a name, proper length zip code, 16-digit number and an expiration date in the future.
# - Write a `card_type` method that will return Visa, MasterCard, Discover, American Express or Other

# ##### BONUS 1
# Credit cards are usually validated using a [Luhn algorithm](http://en.wikipedia.org/wiki/Luhn_algorithm); add a method to your CreditCard class to validate the card number, and incorporate the result into 'valid?'.

# ##### BONUS 2
# This repo has some tests in it using a Ruby testing tool called Rspec; Rspec code looks very similar to another testing tool that you've already used, Jasmine. If you have time, create a new repo and re-create your Credit Card class using a test-driven approach.

require 'pry'

class CreditCard

  def initialize(name, number, cvv, expiration, zip)
    @name = name
    @number = number
    @cvv = cvv
    @expiration = expiration
    @zip = zip
  end

  attr_accessor :name, :number, :cvv, :zip, :expiration

  def name_valid?
    @name != "" && @name != nil && @name.class.name == 'String'
  end

  def number_valid?
    @number != nil && @number.to_s.length == 16 && @number.class.name =="Fixnum"
  end

  def cvv_valid?
    @cvv != nil && @cvv.to_s.length == 3 && @cvv.class.name == "Fixnum"
  end

  def zip_valid?
    @zip != nil && @zip.to_s.length == 5 && @zip.class.name == "Fixnum"
  end

  def expiration_valid?
    current = Time.now.strftime("%m/%Y")
    current.delete("/").chars.inject{|sum,x| sum + x } < @expiration.delete!("/").chars.inject{|sum,x| sum + x }
  end

  def valid?
    name_valid && number_valid && cvv_valid && zip_valid && expiration_valid
  end

end

alex = CreditCard.new("Alex", 1273849573625342, 123, "10/19", 10293)

binding.pry
