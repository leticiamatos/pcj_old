class Blog::CommentsController < ApplicationController

	def create
		@comment = Blog::Comment.new(params[:blog_comment])
		@comment.user = current_user

		if @comment.save
			redirect_to @comment.post
		end
	end

end