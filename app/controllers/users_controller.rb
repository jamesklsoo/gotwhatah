class UsersController < Clearance::UsersController

  def create 
    @user = User.new(user_params)
      if @user.save
        sign_in @user
        redirect_to user_events_path(current_user)
      else
        @error = @user.errors.full_messages
        respond_to do |format|
        format.js
        format.html { render template: "users/new" }
        end
      end
  end

  def show 
    @user = User.find_by_id(params[:id])
  end 

  private

  def user_params
    params.require(:user).permit(:username, :address, :email, :password)
  end 
end