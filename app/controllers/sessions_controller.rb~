class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user # log_in is in sessions_helper.rb
      #remember user # remember is defined in sessions_helper.rb
      params[:session][:remember_me] == '1' ? remember(user) : forget(user) # remember is defined in sessions_helper.rb
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out if logged_in? # log_out is in sessions_helper.rb
    redirect_to root_url
  end

end
