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
    render layout: 'third_party'
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new
    @user = User.new
    @cart = Cart.find(get_cart_id) 
    @cart_items = @cart.cart_items

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    #Assign user params to order 
    params[:order][:email] = params[:user][:email]
    params[:order][:first_name] = params[:user][:first_name]
    params[:order][:last_name] = params[:user][:last_name]
        
    @order = Order.new(params[:order])
   
    if params[:create_account?] == 1
        #If user marked he wants to create an account
        @user = User.new(params[:user])
    end
    
    if (!@user or @user.save) and @order.save
        @cart = Cart.find(get_cart_id)
        @order_items = OrderItem.create_order_items(@order.id, @cart.cart_items)
        redirect_to @order
    else
        #Send back to form with errors
        render action: "new"
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
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
