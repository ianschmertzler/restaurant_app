class Chef <ActiveRecord::Base
	has_many(:orders)
	has_many(:foods, :through => :orders)
	has_many(:parties, :through => :orders)
end