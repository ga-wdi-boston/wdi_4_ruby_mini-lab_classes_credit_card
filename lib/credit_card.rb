require 'pry'

class CreditCard

    attr_accessor :card_type

    def initialize(num, exDate, ccv, name, zip)
        @num = num
        @exDate = exDate
        @ccv = ccv
        @name = name
        @zip = zip
    end

    def validDate?
        @age > 2015
    end

    def validCCV?
        @ccv >= 100 && @ccv < 10000
    end

    def validZip?
        @exDate.length == 5
    end

    def validName?
        @name != true
    end

    def validLength?
        @num < 10000000000000000
    end

    def validNumber?
        s1 = s2 = 0
          @num.to_s.reverse.chars.each_slice(2) do |odd, even|
            s1 += odd.to_i
            double = even.to_i * 2
            double -= 9 if double >= 10
            s2 += double
          end
          (s1 + s2) % 10 == 0
    end
end
