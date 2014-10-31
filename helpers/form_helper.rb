module Sinatra
	module FormHelper
		def form_open(record, options={})
			# form_open(party, {method: "patch"})
			if options[:method]
				method=options[:method]
			else
				method = record.persisted? ? 'get' : 'post'
			end
			action = resource_index_path(record.class.to_s.downcase)
			open_form_tag(action, method, record)
		end

		def form_close()
		"</form>"
		end
	end

end
