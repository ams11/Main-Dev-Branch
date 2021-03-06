authorization do
	role :admin do
		has_permission_on [:pages], :to => [:home, :visitor, :member, :merchant, :admin]
	end
	role :guest do
		has_permission_on [:pages], :to => [:home, :visitor]
	end
	role :member do
		has_permission_on [:pages], :to => [:home, :visitor, :member]
	end
	role :merchant do
		has_permission_on [:pages], :to => [:home, :visitor, :member, :merchant]
	end
end
