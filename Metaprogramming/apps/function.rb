
"""
define functions and compare to methods in Class (extractly, instance of Class ) from file object.rb
"""



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

def replace_item(array,item,item_replace=nil)
        array.each_with_index do |element,index|
            if element == item
                unless item_replace.nil?
                    array[index] = item_replace
                else
                    array.delete_at index
                end
            end
        end
end