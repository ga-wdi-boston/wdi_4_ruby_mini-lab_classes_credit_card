require 'pry'

class CreditCard

  attr_accessor :type, :name, :expiration, :zip

  def initialize(name, number, cvv, expiration, zip)
    @name = name
    @number = number
    @cvv = cvv
    @expiration = expiration
    @zip = zip
  end

    def name_valid?
      @name != "" && @name != nil && @name.class.name == 'String'
    end

    def number_valid?
      @number != nil && @number.to_s.length == 16 && @number.class.name == 'Fixnum'
    end

    def zip_valid?
      @zip != nil && @zip.length == 5 && @zip.class.name =='String'
    end

    def valid?
      @name_valid && @number_valid && @zip_valid
    end

    def expiration_valid?
      time = Time.now.strftime("%m/%Y")
      @expiration.delete_at 2
      time.delete_at 2..4
    end
end

  #def valid?
   # valid = false
    #if @name != "" && @name != nil && @name.class != 'String'
     # if @number != nil && @number.length == 16 && @number.class == 'Fixnum'
      #  if @cvv != nil && @cvv.length == 3 && @cvv.class == 'Fixnum'
       #   if @zip != nil && zip == 5 && @zip =='Fixnum'
        #    valid = true
         # end
       # end
     # end
   # end
   # valid
 # end
# end

andrew = CreditCard.new("Andrew", 1234123412341234, 111, "10/17", "13755")

binding.pry

