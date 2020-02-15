class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      flash[:success] = "Hi member! You successfully logged in!"
      redirect_to root_url
    else
      flash.now[:warning] = "An error occurred!"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "You were logged out of the Member's Club!"
    redirect_to root_url
  end

end
