class SiteconfigController < ApplicationController
  def show
    @siteconfig = Siteconfig.instance
  end

  def edit
    @siteconfig = Siteconfig.instance
  end

  def update
    #Rails.logger.debug "SiteconfigController.update"
    #Rails.logger.debug "params = #{params.to_yaml}"
    #Rails.logger.debug "Siteconfig.instance.public_methods = #{Siteconfig.instance.public_methods.sort.to_yaml}"

    if Siteconfig.instance.update_attributes(params[:siteconfig])
      redirect_to siteconfig_path(1), :notice  => "Successfully updated site configuration."
    else
      render :action => 'edit'
    end
  end

end
