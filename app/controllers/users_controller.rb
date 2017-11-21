class UsersController < ApplicationController
  include ActionView::Helpers::DateHelper
  
  def show
    @user = User.find(params[:id])
    @items = @user.items.all
    @newItems = []
    @regItems = []
    @oldItems = []
    
    @user.items.each do |i|
      if(distance_of_time_in_words(i.created_at, Time.now) == '6 days' ||
        distance_of_time_in_words(i.created_at, Time.now) == '7 days')
        @oldItems << i
        
      elsif(distance_of_time_in_words(i.created_at, Time.now) == '3 days' ||
            distance_of_time_in_words(i.created_at, Time.now) == '4 days' ||
            distance_of_time_in_words(i.created_at, Time.now) == '5 days')
        @regItems << i
        
      else
        @newItems << i
      end
    end
    
  end
end
