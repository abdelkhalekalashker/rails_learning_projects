class SearchController < ApplicationController
#   def index
#     @q = Post.ransack(params[:q])
#     @posts = @q.result
#   end
# end
# before_filter :index

def index 
  @query = Post.ransack(params[:q])
  @posts = @query.result
  
end
