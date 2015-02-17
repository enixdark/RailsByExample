module Hashie
	class Mash < Hashie::Hash
		def method_missing(method_name, *args, &blk)
			return self.[](method_name, &blk) if key?(method_name)
			match = method_name.to_s.match(/(.*?)([?=!]?)$/)
			case match[2]
			when "="
				self[match[1]] = args.first
			else
				default(method_name, *args, &blk)
			end
		end
	end
end
