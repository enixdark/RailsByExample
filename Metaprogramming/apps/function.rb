require_relative 'object'
#replace special character
def to_alphanumeric(s)
  s.gsub /[^\w\s]/, ''
end

#convert
def to_convert_cent_money(money)
    if  [Fixnum,Float].include? money.class
        Money.new(100*money)
    end
end