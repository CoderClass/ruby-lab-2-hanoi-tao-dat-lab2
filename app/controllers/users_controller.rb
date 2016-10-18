class UsersController < ApplicationController
  before_action :require_login, except: [:new]
  before_action :skip_if_logged_in, except: [:index, :create]

  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = 'User is created successfully.'
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
