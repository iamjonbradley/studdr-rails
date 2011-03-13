class VotesController < ApplicationController
  def create
    if current_user

    old_votes = Vote.find(:all, :conditions => ['user_id = ? and post_id = ?', current_user.id, params[:vote][:post_id]])
  
    if old_votes.count >= 1 or current_user
      respond_to do |format|
          #format.html { redirect_to(posts_path, :notice => 'Stop trying to cheat Foo!') }
          format.html { redirect_to(request.referer, :notice => 'Stop trying to cheat Foo!') }
      end 
    else 
      @vote = Vote.new(params[:vote])
      @vote.user_id = current_user.id
    
      respond_to do |format|
        if @vote.save
          format.html { redirect_to(request.referer, :notice => 'Thanks for Voting! Biach') }
        else
          format.html { render :action => "new" }
       end
      end
    end
    else
      respond_to do |format|
          format.html { redirect_to(request.referer, :notice => 'Sorry you are you not logged in!') }
      end 

    end  
  end

end
