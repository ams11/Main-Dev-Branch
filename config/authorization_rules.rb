authorization do
	role :guest do
		has_permission_on :pages, :to => [:home, :visitor]
		has_permission_on :users, :to => [:new, :create]
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
		has_permission_on :sproducts, :to => [:index, :show, :edit, :new, :create, :update, :destroy]
	end
	role :admin do
		has_permission_on :pages, :to => [:home, :visitor, :member, :merchant, :admin]
		has_permission_on :users, :to => [:destroy, :index, :new, :create, :edit, :update]
		has_permission_on :sproducts, :to => [:index, :show, :edit, :new, :create, :update, :destroy]
		has_permission_on :authorization_rules, :to => :read
	end
end