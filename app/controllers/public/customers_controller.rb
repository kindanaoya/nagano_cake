class Public::CustomersController < ApplicationController
  def show
    @customers = Customer.all
    @customer = Customer.find(params[:id])

    if @customer != current_customer
      redirect_to root_path
    end
  end


  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
        redirect_to customer_path(@customer)
    else
        render 'edit'
    end
  end

  def confirm
  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: false)
    reset_session
    flash[ :alert] = "退会しました。"
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :password, :password_confirmation)
  end
end
