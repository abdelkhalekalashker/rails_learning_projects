class ApplicationsController < ApplicationController

  before_action :authenticate_user!
    def create
      @post = Post.find(params[:post_id])
      @application = @post.applications.create(application_params)
      @application.user = current_user
      
      if @application.save
        flash[:notice] = "application has been created"
        redirect_to post_path(@post)
      else
        flash[:alert] = "application has not been created"
        redirect_to post_path(@post)
      end

    end

    def destroy
        @post = Post.find(params[:post_id])
        @application = @post.applications.find(params[:id])
        @application.destroy
        redirect_to post_path(@post)
    end

    private
    def application_params
        params.require(:application).permit(:body)
    end
end
