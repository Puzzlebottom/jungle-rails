class Admin::DashboardController < ApplicationController
  include RestrictAccess
  def show
    @products = Product.all
    @categories = Category.all
  end
end
