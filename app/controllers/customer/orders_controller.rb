class Customer::OrdersController < ApplicationController
    
    # ログイン中のユーザのみアクセス許可
    before_action :authenticate_customer!
    
end
