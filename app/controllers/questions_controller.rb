class QuestionsController < ApplicationController
	def index
		@questions = Question.all
		#@questions = Question.paginate(:page => params[:page], :per_page => 10)
	end

	def create
		@question = current_user.questions.build(params[:question])
		if @question.save
			flash[:success] = "Question Posted Successfully"
			redirect_to root_path
		else
			render 'users/show'
		end
	end

	def show
		@question = Question.find(params[:id])
        #if signed_in?
 		#	@user_who_commented = @current_user
        #	@comment = Comment.build_from( @question, @user_who_commented.id, "Hey guys this is my comment!" )
		#end
		@answer = @question.answers.build if signed_in?
	end

	def destroy
		
	end

end
