require 'test/unit'
require_relative '../apps/monday/extension_class'
require_relative '../apps/monday/function'
require_relative '../apps/monday/object'
require_relative '../apps/monday/module'

require 'byebug'

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

# class NumericExtensionsTest < Test::Unit::TestCase
#     def test_function_use_object_convert_and_Numeric_object_convert
#         object1 = to_convert_cent_money(100)
#         object2 = 100.to_convert_cent_money
#         assert object1.class == object2.class && object1.money == object2.money
#     end

# end

# class ArrayExtensionsTest < Test::Unit::TestCase
#     def test_replace_array_by_item
#         array = ['Java','Python','Ruby','C++','Go','Javascript','Scala']
#         len = array.length
#         array.replace_item('Java','Julia')
#         assert  !array.include?('Java')
#         assert  array.include?('Julia')
#         array.replace_item('Python')
#         assert_equal array.length,len-1

#     end
# end

class AdvanceOOPTest < Test::Unit::TestCase
    include M

    def test_relative_between_parent_class_and_child_class
        obj1 = MySubClass.new
        assert_equal obj1.my_method,'my_method()'
    end

    def test_check_function_in_module_through_class
        obj = D.new
        assert_equal obj.my_method,my_method
    end

    def test_keyword_self_of_class
        obj = Myclass.new
        obj.test_self
        obj.test_self
        assert_equal obj.var,11
    end
end
