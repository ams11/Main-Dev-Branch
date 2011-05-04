
# This class must cache the open order results for a period of time so we don't
# exceed the API call limit.  We should cache open order counts and status by Merchant
# and refresh every few minutes (once an hour?).

class Sorder
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  ShopifyAPI::Base.site = 'http://' + APP_CONFIG['shopify_api_key'] + ':' + APP_CONFIG['shopify_password'] + '@' + APP_CONFIG['shopify_store_url'] + '/admin'

  attr_accessor :tracking_number
  attr_reader :line_items_shipped, :order, :shopify_id
  
  # validation rules here

  def self.countOpen(attributes = {})
    begin
      allOpenOrders = ShopifyAPI::Order.find(:all, :params => {:status => "open"})
      @orders = forVendor(allOpenOrders, attributes[:vendor])
      @orders.size
    rescue
      "Lookup failed"
    end
  end
  
  def self.getOpen(attributes = {})
    begin
      allOpenOrders = ShopifyAPI::Order.find(:all, :params => {:status => "open"})
      @orders = forVendor(allOpenOrders, attributes[:vendor]).select { |o| o.unshipped_items_for_vendor }
    rescue
      Rails.logger.error "Sorder.getOpen failed"
      nil
    end
  end
  
  def self.getAll(attributes = {})
    begin
      allOrders = ShopifyAPI::Order.find( :all, :params => { :status => "any" } )
      Rails.logger.debug "allOrders.size = #{allOrders.size}"
      @orders = forVendor(allOrders, attributes[:vendor])
    rescue
      Rails.logger.error "Sorder.getAll failed"
      nil
    end
  end
  
  def self.find(id, params = {})
    begin
      order = ShopifyAPI::Order.find(id)
      @order = forVendor([order], params[:vendor]).first
    rescue
      Rails.logger.error "Sorder.find failed"
      nil
    end
  end
  
  def initialize()
    @line_items_shipped = []
  end
  
  def find(id, params = {})
    order = ShopifyAPI::Order.find(id)
    @order = self.class.forVendor([order], params[:vendor]).first
    @shopify_id = @order.id
    @tracking_number = ""
      self
  end
  
  def update_attributes(attributes = {})
    return false if !valid?
  
    params = { 
      :tracking_number => "#{attributes[:tracking_number]}", 
      :order_id => "#{@shopify_id}",
      :line_items => [] }
 
    @order.line_items.each do |li|
      if li.fulfillment_status != "fulfilled" && attributes[:shipped].fetch(li.id.to_s, false)
        params[:line_items] << { :id => "#{li.id}" }
      end
    end unless attributes[:shipped].nil?

    ShopifyAPI::Fulfillment.create(params)
  end
  
  def to_key
    [@shopify_id]
  end
  
  def persisted?
    true
  end

  private
  
  def self.forVendor(orders = [], vendor = "")
    orders.select do |o|
      o.line_items.delete_if { |li| li.vendor != vendor }
      addVendorAttributes(o)
      !o.line_items.empty?
    end
  end
  
  # TODO Add commission data.
  def self.addVendorAttributes(o)
    o.class.send :attr_accessor, :unshipped_items_for_vendor, :total_line_items_price_vendor, :shipping_vendor, :total_price_vendor
    o.unshipped_items_for_vendor = false
    o.total_line_items_price_vendor = 0.0
    o.line_items.each do |li| 
      o.unshipped_items_for_vendor = o.unshipped_items_for_vendor || li.fulfillment_status != "fulfilled"
      o.total_line_items_price_vendor += li.price * li.quantity
    end
    o.shipping_vendor = (o.total_price - o.total_line_items_price) * (o.total_line_items_price_vendor / o.total_line_items_price)
    o.total_price_vendor = o.total_line_items_price_vendor + o.shipping_vendor
  end
  
end

