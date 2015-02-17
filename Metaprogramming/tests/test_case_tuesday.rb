require 'test/unit'

require_relative '../apps/tuesday_Method/simpleMethod'
require_relative '../apps/tuesday_Method/dynamic_dispatch'
require_relative '../apps/tuesday_Method/dynamic_method'
require_relative '../apps/tuesday_Method/data_source'
require_relative '../apps/tuesday_Method/full_dynamic_method'

require 'json'
require 'byebug'

class MethodTest < Test::Unit::TestCase

	def setup
		@data = JSON.load(open('../apps/tuesday_Method/data.json').read())
	end
	def test_compare_between_simple_and_dynamic
		obj1 = DS.new(@data)
		id = 1
		_Sobj = SimpleComputer.new(id,obj1)
		_Dobj = DynamicComputer.new(id,obj1)
		assert_equal _Sobj.cpu,_Dobj.cpu
	end

	def test_compare_between_double_dynamic_method
		obj1 = DS.new(@data)
		id = 1
		_Dobj = DynamicComputer.new(id,obj1)
		_UDobj = DynamicComputer.new(id,obj1)
		assert_equal _Dobj.cpu,_UDobj.cpu
		assert_equal _Dobj.keyboard,_UDobj.keyboard
	end

	def test_full_dynamic_method
		obj1 = DS.new(@data)
		id = 1
		_Dobj = DynamicComputer.new(id,obj1)
		_Fobj = DynamicComputer.new(id,obj1)
		assert_equal _Dobj.cpu,_UDobj.cpu
		assert_equal _Dobj.keyboard,_UDobj.keyboard
	end
end
