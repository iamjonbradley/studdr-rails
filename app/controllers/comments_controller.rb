class CommentsController < ApplicationController
  def create
    if current_user

      @comment = Comment.new(params[:comment])
      @comment.user_id = current_user.id
    
      respond_to do |format|
        if @comment.save
          format.html { redirect_to(post_path(@comment.post), :notice => 'Thanks for commenting!') }
        else
          format.html { render :action => "new" }
        end
      end
    else
      respond_to do |format|
          format.html { redirect_to(request.referer, :notice => 'Please Login to post') }
      
      end
    end
  end
end
