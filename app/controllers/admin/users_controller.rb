class Admin::UsersController < ApplicationController
  before_filter :only_admins


  def index
   @users = User.all.page(params[:page]).per(10)
  end

  def destroy
    @user = User.find(params[:id])
    UserMailer.delete_email_sender(@user).deliver
    @user.destroy 
    redirect_to admin_users_path
  end

  def edit
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def impersonate
    @user = User.find params[:id]
    if session[:actual_user_id]

    else
      session[:actual_user_id] = session[:user_id]
    end
      session[:user_id] = @user.id
      redirect_to admin_users_path
  end

  def depersonate
    session[:user_id] = session[:actual_user_id]
    redirect_to admin_users_path
  end


  protected



  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end


  private 

  def only_admins
    redirect_to(root_path) unless admin?
  end

  

end
