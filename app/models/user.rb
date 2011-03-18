class User < ActiveRecord::Base
  acts_as_authentic
  
  serialize :roles, Array
  def role_symbols
	@role_symbols ||= (roles || []).map {|r| r.to_sym}
  end
  
end
