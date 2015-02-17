class DS


	def initialize
		@ds = {}
	end

	def initialize(ds)
		@ds = ds
	end

	def get_cpu_info(workstation_id)
		if @ds.has_key? workstation_id
			@ds[workstation_id][:cpu][:info]
		end
	end
	def get_cpu_price(workstation_id)
		if @ds.has_key? workstation_id
			@ds[workstation_id][:cpu][:price]
		end
	end
	def get_mouse_info(workstation_id)
		if @ds.has_key? workstation_id
			@ds[workstation_id][:mouse][:info]
		end
	end

	def get_mouse_price(workstation_id)
		if @ds.has_key? workstation_id
			@ds[workstation_id][:mouse][:price]
		end
	end
	def get_keyboard_info(workstation_id)
		if @ds.has_key? workstation_id
			@ds[workstation_id][:keyboard][:info]
		end
	end
	def get_keyboard_price(workstation_id)
		if @ds.has_key? workstation_id
			@ds[workstation_id][:keyboard][:price]
		end
	end
	def get_display_info(workstation_id)
		if @ds.has_key? workstation_id
			@ds[workstation_id][:display][:info]
		end
	end
	def get_display_price(workstation_id)
		if @ds.has_key? workstation_id
			@ds[workstation_id][:display][:price]
		end
	end
end
