class PagesController < ApplicationController
  filter_access_to :all

  def visitor
  end

  def member
  end

  def merchant
  end

  def admin
  end

end
