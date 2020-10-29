class Customer::CustomersController < ApplicationController
  
  # ログイン中のユーザのみアクセス許可
  before_action :authenticate_customer!

  def show
   @customer = current_customer
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました。"
       redirect_to customers_path(@customer)
    else
       render "edit"
    end
  end

  def edit
      @customer = Customer.find(current_customer.id)
  end

  def withdrawal
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    # ログイン、ユーザーを弾く
    reset_session
    #登録情報の消去メソッド
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:email,:address,:phone_number)
  end
end
