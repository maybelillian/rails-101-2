class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
  	@posts = current_user.posts
  	
  end

  def update
		

		if @post.update(post_params)

		   redirect_to posts_path,notice: "Update Success"
	    else
		   render :edit
	    end
	end

	def destroy
		

		@post.destroy
		flash[:alert] = "post deleted"
		redirect_to posts_path
		
	end

		def post_params
		params.require(:post).permit(:content, :group.title,:updated_at)
		
	end
end
