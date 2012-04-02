class PagesController < ApplicationController
  	

  def home
    @question = current_user.questions.build if signed_in?
    # render 'users/show' 	
  end

  def about
  end

  def contact
  end

  def help
  end
  
  
end
