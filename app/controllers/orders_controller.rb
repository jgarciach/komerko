class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id]) 
    @order_items = @order.order_items
    @address = @order.address
    render layout: 'third_party'
  end

  # GET businesses/:business_id/orders/new
  def new
    @order = Order.new(business_id: params[:business_id])
    @user = User.new
    @business = Business.find(params[:business_id])
    @address = Address.new
    @cart = Cart.find(get_cart_id(params[:business_id])) 
    @cart_items = @cart.cart_items
    render layout: 'third_party'
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST businesses/:business_id/orders
  def create
    @order = Order.new(params[:order])
    @business = Business.find(params[:business_id])
    @order.business_id = @business.id
    @cart = Cart.find(get_cart_id(@business.id))
    @address = Address.new(params[:address])
    @user = current_user || User.new(params[:user]) 

    if @order.checkout(@business, @cart, current_user, params[:user], @address)
      redirect_to business_order_path(@business, @order)
    else
      @cart_items = @cart.cart_items
      render action: "edit", layout: "third_party"
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to business_orders_url(params[:business_id]) }
      format.json { head :no_content }
    end
  end
  
end
