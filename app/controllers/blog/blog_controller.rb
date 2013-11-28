class Blog::BlogController < ApplicationController

	def index
		@posts = Blog::Post.order(:hits).includes(:blog).where("blog_blogs.domain_id = ?", ApplicationController::DOMAIN_ID)
		
		if params[:teacher_id]
			user_id = Cers::Teacher.select('user_id').try(:find, params[:teacher_id]).user_id
			@posts = @posts.includes(:blog).where("blog_blogs.user_id = ?", user_id)
		end

		@posts = @posts.page params[:page]

		render "blog/index"
	end

	def blogs

		@blogs = Blog::Blog.all

		render "blog/blogs"
	end


end