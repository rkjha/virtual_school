class AnswersController < ApplicationController
	def create
		@answer = current_user.answers.build(params[:answer])
		if @answer.save
			flash[:success] = "Answer Posted Successfully"
			redirect_to root_path
		else
			redirect_to root_path
		end
		
	end
end

