class AnswersController < ApplicationController
	def create
			#@answer = @question.answers.build(params[:answer])
			#@answer = Answer.new (params[:answer][:question_id])
			@answer = Answer.new(params[:answer]) 
		if @answer.save
			flash[:success] = "Answer Posted Successfully"
			redirect_to root_path
			#redirect_to @answer
		else
			redirect_to 'users/show'
		end
		
	end
end

