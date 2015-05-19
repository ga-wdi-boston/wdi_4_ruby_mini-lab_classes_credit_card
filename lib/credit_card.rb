require'pry'
require 'date'
class CreditCard
  attr_accessor :name , :zipcode
  def initialize(name, cc_number,exp_dt, cvv,zipcode )
    @name = name
    @cc_number = cc_number
    @exp_dt = exp_dt
    @cvv = cvv
    @zipcode = zipcode
  end
 def zipcode_num?

 end

  # def valid?
  #   if !name
  #     false
  #   end
  #   if !zipcode.length ==5
  #     false
  #   end
  #   if !@cc_number.length ==16
  #     false
  #   end
  #   if Date.today.strftime("%y").to_i >= @exp_dt.slice(2,2).to_i
  #     if Date.today.strftime("%m").to_i > @exp_dt.slice(0,2).to_i
  #       false
  #     end
  #   end

  # end
  def valid_name?
    name!=nil
  end

  def valid_zip?
    zipcode.length ==5
  end
  def valid_cc_number?
    @cc_number.length ==16
  end
  def expt_date?
    if Date.today.strftime("%y").to_i <= @exp_dt.slice(2,2).to_i
      if Date.today.strftime("%y").to_i <= @exp_dt.slice(2,2).to_i && Date.today.strftime("%m").to_i < @exp_dt.slice(0,2).to_i
      end
    end
  end

end

cc = CreditCard.new("kin","1234567892345678","0415","123","21201")
binding.pry
