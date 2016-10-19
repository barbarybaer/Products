class CommentsController < ApplicationController
  def index
  	@comments = Comment.find_by_sql("select comment, name from comments c join products p on p.id = c.product_id ")
  end

  def create
  	 # render :text =>"in comments/create"
    c = Comment.new(comment_params)
    if c.save
      redirect_to :back
      
    else
      flash[:errors] = c.errors.full_messages
      redirect_to :back
    end
  
  end

   private 
  def comment_params
    params.require(:comment).permit(:comment, :product_id)
  end
end

