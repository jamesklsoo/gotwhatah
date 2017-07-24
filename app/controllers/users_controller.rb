class UsersController < Clearance::UsersController

  def create 
    @user = User.new(user_params)
      if @user.save
        sign_in @user
        redirect_to events_path
      else
        @error = @user.errors.full_messages
        respond_to do |format|
        format.js
        format.html { render template: "users/new" }
        end
      end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end 
end