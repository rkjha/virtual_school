class VideosController < ApplicationController
	
	def search
		keyword = params[:keyword]
		# @videos = YoutubeSearch.search(keyword, :page => 10, :per_page => 4).first
		@videos = YoutubeSearch.search(keyword,'max-results' => '4', 'start-index' => '1')
		@related_questions = Question.find_with_index(keyword)
	end

end
