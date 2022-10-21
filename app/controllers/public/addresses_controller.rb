class Public::AddressesController < ApplicationController
  def index
    @customer = current_customer
    @addresses = @customer.addresses
    @address = Address.new
  end

  def edit
    @customer = current_customer
    @address = current_customer.addresses.find_by(params[:id])
  end

  def create
    @address = Address.new(address_params)
		@address.customer_id = current_customer.id
		if @address.save
			redirect_to addresses_path(current_customer.id)
		else
			@addresses = @customer.addresses
			render 'index'
		end
  end

  def update
    @address = current_customer.addresses.find_by(params[:id])
		if @address.update(address_params)
			redirect_to addresses_path
		else
			@customer = Customer.find(params[:Customer_id])
			render 'edit'
		end
  end

  def destroy
    @address = current_customer.addresses.find_by(params[:id])
		@address.destroy
		redirect_to addresses_path
  end

  private
  def address_params
        params.require(:address).permit(:postal_code, :address, :name)
  end
end
