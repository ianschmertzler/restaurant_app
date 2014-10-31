module Sinatra
	module Linkroute

		def index_resource_path(resource)
			"/#{pluralize(resource)}"
		end

		def new_resource_path(resource)
			"/#{pluralize(resource)}/new"
		end

		def edit_resource_path(resource)
			"/#{pluralize(resource)}"
		end

		def view_resource_path(resource)
			"/#{pluralize(resource)}/show"
		end

		def constant_defined?(resource)
			resource=singularlize(resource).capitalize
			Module.const_defined?(resource)
		end
	end
end