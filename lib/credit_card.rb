class CreditCard

  attr_accessor :card_type

  def initialize(number, exp_date, ccv, name, zip, card_type)
      @number = number
      @exp_date = exp_date
      @ccv = ccv
      @name = name
      @zip = zip
      @card_type = card_type
  end

  def valid?
    @name &&
    @zip.to_s.length == 5 &&
    @number.to_s.length == 16 &&
    (if (@exp_date.split("/").at(1).to_i + 2000 > Time.now.year)
        true
    elsif (@exp_date.split("/").at(1).to_i + 2000 == Time.now.year)
      @exp_date.split("/").at(0).to_i > Time.now.month
    end)
  end

# my teacher:
# http://stackoverflow.com/questions/9188360/implementing-the-luhn-algorithm-in-ruby
#   def luhnCheck?
#     every_other_xtwo = @number.to_s.reverse.to_i. --need to convert to array --- each_slice(2).map do |x, y|
#       [(x * 2), y || 0]
#     end
#     every_other_xtwo.flatten
#   end



end

sampleCard = CreditCard.new(1234567890123456, "01/16", 345, "Bob Bobbington", 12345, "MasterCard")
