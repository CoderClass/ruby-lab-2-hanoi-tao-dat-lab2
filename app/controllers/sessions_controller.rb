class SessionsController < ApplicationController
  before_action :skip_if_logged_in, except: [:new, :destroy]

  def new
  end

  def create
    if @user = User.find_by_email(params[:email])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash.now[:success] = 'Login successfully.'
            redirect_to users_path
        else
            flash.now[:error] = 'Incorrect password'
            render 'new'
        end
    else
        flash.now[:error] = 'User not found.'
        render 'new'
    end
  end

  def destroy
      session[:user_id] = nil
      flash[:success] = 'Logout successfully.'
      redirect_to root_path
  end
end
