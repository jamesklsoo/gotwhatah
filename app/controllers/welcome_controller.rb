class WelcomeController < ApplicationController
  def home
    if signed_in?
      render "welcome/index"
    else
      redirect_to "/sign_up"
    end
  end
end
