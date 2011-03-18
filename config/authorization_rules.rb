authorization do
	role :guest do
		has_permission_on :pages, :to => [:home, :visitor]
	end
	role :visitor do
		has_permission_on :pages, :to => [:home, :visitor]
	end
	role :member do
		has_permission_on :pages, :to => [:home, :visitor, :member]
		has_permission_on :users, :to => [:new, :create, :edit, :update]
	end
	role :merchant do
		has_permission_on :pages, :to => [:home, :visitor, :member, :merchant]
		has_permission_on :users, :to => [:new, :create, :edit, :update]
	end
	role :admin do
		has_permission_on :pages, :to => [:home, :visitor, :member, :merchant, :admin]
		has_permission_on :users, :to => [:destroy, :index, :new, :create, :edit, :update]
	end
end