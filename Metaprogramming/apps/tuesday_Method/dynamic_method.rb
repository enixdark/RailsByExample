class DynamicMethodComputer

	def initialize(computer_id,data_source)
		@data_source = data_source
		@id = computer_id
	end



	def self.define_component(name)
		define_method(name) do
			info = @data_source.send "get_#{name}_info",@id
			price = @data_source.send "get_#{name}_price",@id
			result = "#{name.capitalize}: #{info} ($#{price})"
			return "* #{result}" if price >= 100
			result
		end
	end

	define_component :mouse
	define_component :display
	define_component :keyboard
	define_component :cpu
end
