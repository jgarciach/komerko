require 'spec_helper'

describe Order do
  it "has an email if order_type is guest" do
    @order = Order.new
    @order.order_type = "guest"
    @order.should_not be_valid
  end
end
