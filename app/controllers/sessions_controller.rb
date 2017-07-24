class SessionsController < Clearance::SessionsController

  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        redirect_to user_events_path(user_id: @user.id)
      else
        # flash.now.notice = status.failure_message
        @error = status.failure_message
        respond_to do |format|
        format.js
        format.html { render template: "sessions/new" }
        end
      end
    end
  end
end 