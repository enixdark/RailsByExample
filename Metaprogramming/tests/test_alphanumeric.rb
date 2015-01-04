require 'test/unit'
require_relative '../apps/extension_class'
require_relative '../apps/function'
require_relative '../apps/object'


# class StringExtensionsTest < Test::Unit::TestCase
#     def test_strips_non_alphanumeric_characters
#         assert_equal '3 the Magic Number', '#3, the *Magic, Number*?'.to_alphanumeric
#     end
#     def test_strips_non_alphanumeric_characters
#         assert_equal '3 the Magic Number' , to_alphanumeric('#3, the *Magic, Number*?' )
#     end
#     # def test_compare_non_open_class_and_open_class_alphanumeric
#     #     assert_equal to_alphanumeric('seven_7'),"7".to_alphanumeric

#     # end
# end

class NumericExtensionsTest < Test::Unit::TestCase
    def test_function_use_object_convert_and_Numeric_object_convert
        object1 = to_convert_cent_money(100)
        object2 = 100.to_convert_cent_money
        assert object1.class == object2.class && object1.money == object2.money
    end

end
