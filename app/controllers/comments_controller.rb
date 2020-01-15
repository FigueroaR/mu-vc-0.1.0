class CommentsController < ApplicationController 
  skip_before_action :verified_user, only: [:create]
  def create
    #binding.pry
    comment = Comment.create(comment_params)
    #binding.pry
    redirect_to comment.event
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :event_id, :user_id, user_attributes:[:name])
  end
end 