class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer was successfully updated.'
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(
      :first_name, :last_name, :email, :password, :password_confirmation,
      :primary_address, :primary_city, :primary_postal_code, :primary_province_id,
      :alt_address, :alt_city, :alt_postal_code, :alt_province_id
    )
  end
end
