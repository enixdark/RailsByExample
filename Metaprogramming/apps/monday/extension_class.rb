
"""
extension Class from Array,Numeric,.....
"""

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

#extend Array class
class Array
    #replace or remove item in array
    def replace_item(item,item_replace=nil)
        self.each_with_index do |element,index|
            if element == item
                unless item_replace.nil?
                    self[index] = item_replace
                else
                    self.delete_at index
                end
            end
        end
    end
end


