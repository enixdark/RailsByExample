
class Computer

	def initialize(computer_id,data_source)
		@data_source = data_source
		@id = computer_id
	end

	def mouse
		component :mouse
	end

	def keyboard
		component :keyboard
	end

	def mouse
		component :mouse
	end

	def display
		component :display
	end

	def component(name)
		info = @data_source.send "get_#{name}_info",@id
		price = @data_source.send "get_#{name}_price",@id
		result = "#{name.capitalize}: #{info} ($#{price})"
		return "* #{result}" if price >= 100
		result
	end
end
