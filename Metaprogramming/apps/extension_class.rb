require_relative 'object'

#extend String class
class String
  def to_alphanumeric
    gsub /[^\w\s]/, ''
  end
end

#extend Numeric class
class Numeric
    #convert $ -> cent
    def to_convert_cent_money
        Money.new(self*100)
    end
end

