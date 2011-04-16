class SordersController < ApplicationController
  def index
    @orders = Sorder.getAll({:vendor => current_user.shopify_product_vendor})
  end

  def open
    @orders = Sorder.getOpen({:vendor => current_user.shopify_product_vendor})
  end

  def show
    Rails.logger.debug "show: id = #{params[:id]}"
    @order = Sorder.find( params[:id], {:vendor => current_user.shopify_product_vendor} )
  end

  def edit
    Rails.logger.debug "edit: id = #{params[:id]}"
    @sorder = Sorder.new.find( params[:id], {:vendor => current_user.shopify_product_vendor} )
  end

  def update
    Rails.logger.debug "update: params = #{params.to_yaml}"
    @sorder = Sorder.new.find( params[:sorder][:shopify_id], {:vendor => current_user.shopify_product_vendor} )

    respond_to do |format|
      if @sorder.update_attributes(params[:sorder])
        format.html { redirect_to :action => "show", :id => "#{params[:sorder][:shopify_id]}", :notice => 'Sorder was successfully updated.' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sorder.errors, :status => :unprocessable_entity }
      end
    end
  end

end
