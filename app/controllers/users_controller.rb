class UsersController < ApplicationController
  before_filter :authenticate!, :except => [:new, :create]
  def new
    if(current_user)
      # session[:saved_url] = request.url
      redirect_to communities_path
    end
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id

      ru = session[:saved_url] || root_url
      session[:saved_url] = nil
      redirect_to ru, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def gettingstarted
  end

end
