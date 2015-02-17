# class MissingMethod
# 	#overriden the missing method
# 	def method_missing(method,*args)
# 		puts "You called: #{method}(#{args.join(', ')})"
# 		puts "(You also passed it a block)" if block_given?
# 	end
# end

class MissingComputer
	def initialize(computer_id, data_source)
		@id = computer_id
		@data_source = data_source
	end

	def method_missing(name)
		super if !@data_source.respond_to?("get_#{name}_info")
		info = @data_source.send("get_#{name}_info", @id)
		price = @data_source.send("get_#{name}_price", @id)
		result = "#{name.capitalize}: #{info} ($#{price})"
		return "* #{result}" if price >= 100
		result
	end
end
