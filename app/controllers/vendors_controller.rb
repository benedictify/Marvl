class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    @reviews = @vendor.reviews
  end

end