class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @event = Event.find_by_id(params[:event_id])
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @event = Event.find_by_id(params[:event_id])
    @comment.event_id = params[:event_id]
    if @comment.save
      redirect_to user_event_path(current_user, @event)
    else
      redirect_to new_event_comment_path(@event)
    end
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end
