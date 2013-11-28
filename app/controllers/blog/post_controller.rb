class Blog::PostController < ApplicationController

	def index
		@posts = Blog::Post.includes(:blog).where("blog_blogs.domain_id = ?", ApplicationController::DOMAIN_ID)

		@posts = @posts.includes(:blog).where("blog_blogs.user_id = ?", params[:teacher_id]) if params[:teacher_id]

		@posts = @posts.all

		render "blog/index"
	end

	def show

		@blog_post = Blog::Post.find(params[:id])

		render "blog/post"
	end


end