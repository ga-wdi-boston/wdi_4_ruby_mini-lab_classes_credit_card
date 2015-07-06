class CreditCard

  def initialize (number,expiry,ccv,name,zip,card_type)
    @number = number
    @expiry = expiry
    @ccv = ccv
    @name = name
    @zip = zip
    @card_type = card_type
  end

  attr_accessor :card_type

  def valid?
    @name &&
    @zip.to_s.length == 5 &&
    @number.to_s.length == 16 &&

    (if (@expiry.split('/').at(1).to_i + 2000 > Time.now.year)
      true
    elsif (@expiry.split('/').at(1).to_i + 2000 == Time.now.year)
      @expiry.split('/').at(0).to_i > Time.now.month
    end)




  end

end

sampleCard = CreditCard.new(1234567891234567, "06/15", 123, "Max", 12345, "Visa")

if sampleCard.valid?
  p sampleCard
else
  p "wrong card information"
end

p sampleCard.card_type



#Luhns Algorithm

@number.to_s.reverse.scan(/./).map(&:to_i)
