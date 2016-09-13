class BlogPostsController < ApplicationController
	def index
		@blog_posts = BlogPost.all
	end

	def new
		@blog_post = BlogPost.new
	end
	
	def create
		@blog_post = BlogPost.new(blog_post_params)
		if @blog_post.valid?
			@blog_post.save
			redirect_to @blog_post
		else
			render 'new'
		end
	end

	def edit
		@blog_post = BlogPost.find(params[:id])
	end

	def update
		@blog_post = BlogPost.find(params[:id])
		@blog_post.update_attributes(blog_post_params)
		if @blog_post.valid?
			@blog_post.save
			redirect_to @blog_post
		else
			render 'edit'
		end
	end
	
	def destroy
		BlogPost.find(params[:id]).destroy
    flash[:success] = "BlogPost deleted"
    redirect_to blog_posts_path
	end

	def show
		@blog_post = BlogPost.find(params[:id])
		@user = @blog_post.user
		# raise 'a'
	end

	private

	def blog_post_params
		params.require(:blog_post).permit(:title, :summary, :content, :user_id, :title_image_url)
	end

end