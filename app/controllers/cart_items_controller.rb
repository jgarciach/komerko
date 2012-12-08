class CartItemsController < ApplicationController
  # POST /cart_items
  # POST /cart_items.json
  def create
    #Need to select the correct cart depending on business; for now, user only has one cart
    params[:cart_item][:cart_id] = get_cart_id
    @cart_item = CartItem.new(params[:cart_item])
    
    if @cart_item.save
        @notification = {notice: "Item added succesfully"} 
    else
        @notification = {alert: "Item could not be added"}
    end

    redirect_to "/items/store", @notification
      
  end

  # PUT /cart_items/1
  # PUT /cart_items/1.json
  def update
    @cart_item = CartItem.find(params[:id])

    respond_to do |format|
      if @cart_item.update_attributes(params[:cart_item])
        format.html { redirect_to :back, notice: 'Quantity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :back, alert: 'Error, quanity was not updated.' }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    respond_to do |format|
      format.html { redirect_to cart_items_url }
      format.json { head :no_content }
    end
  end

end
