class ItemsController < ApplicationController
  def create
    user = current_user
    @item = user.items.new
    @item.name = params[:item][:name]
    if @item.save
      flash[:notice] = "Item saved successfully."
      redirect_to current_user
    else
      flash[:alert] = "Item failed to save."
      redirect_to current_user
    end
  end
end
