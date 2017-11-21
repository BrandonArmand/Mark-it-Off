class ItemsController < ApplicationController
  def create
    user = current_user
    @item = user.items.new
    @item.name = params[:item][:name]
    if @item.save
      flash[:notice] = "New task created."
      redirect_to current_user
    else
      flash[:alert] = "Task failed to save, try again."
      redirect_to current_user
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash.now[:notice] = "Task completed!"
     # redirect_to current_user
    else
      flash.now[:alert] = "Task failed to complete, try again."
      #redirect_to current_user
    end
  end
end
