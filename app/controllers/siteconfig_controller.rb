class SiteconfigController < ApplicationController
  def show
    @siteconfig = Siteconfig.instance
    Rails.logger.debug "show========================="
    Rails.logger.debug "siteconfig = #{@siteconfig.to_yaml}"
    @siteconfig
  end

  def edit
    @siteconfig = Siteconfig.instance
    Rails.logger.debug "edit========================="
    Rails.logger.debug "siteconfig = #{@siteconfig}"
    @siteconfig
  end

  def update
    Rails.logger.debug "SiteconfigController.update"
    Rails.logger.debug "params = #{params}"
    Rails.logger.debug "params[:siteconfig] = #{params[:siteconfig]}"
    #Rails.logger.debug "params = #{params.to_yaml}"
    #Rails.logger.debug "Siteconfig.instance.public_methods = #{Siteconfig.instance.public_methods.sort.to_yaml}"

    if Siteconfig.instance.update_attributes(params[:siteconfig])
      redirect_to siteconfig_path(1), :notice  => "Successfully updated site configuration."
    else
      render :action => 'edit'
    end
  end

end
