class Customer::CustomersController < ApplicationController

 def new
   @customner = Customer.new
end
