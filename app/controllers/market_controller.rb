class MarketController < ApplicationController
  def show
    Rails.logger.debug "MarketController.show(): path = #{params[:path]}"
    @path = params[:path]
  end

end
