class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  # before_action :correct_user, only: [:edit, :update, :destroy]


  # GET /events
  # GET /events.json
  def index
    @events = Event.order(updated_at: :desc)

    if params[:search]
      @event_search = Event.category_search(params[:category_search]).search(params[:search]).order("created_at DESC")
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @user = User.find_by_id(params[:user_id])
    @comment = Comment.where(event_id: params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create

    @event = current_user.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to user_events_path, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @event = Event.find(params[:id])
    @event.upvote_by current_user
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Like was increase.' }
      format.js { }
    end

  end

  def downvote
    @event = Event.find(params[:id])
    @event.downvote_by current_user
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Dislike was increase.' }
      format.js { }
    end

  end

  # def correct_user
  #   @event = Event.find_by(id: params[:id])
  #   unless current_user?(@event.user)
  #     redirect_to user_path(current_user)
  #   end
  # end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:user_id, :title, :description, :address, :start_date, :end_date, :category, :upvote, :downvote, {images: []})
  end
end
