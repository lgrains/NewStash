class UsersController < ApplicationController
  before_filter :authenticate_user!

  layout 'application'

  def edit
    @user = current_user
  end

  def update
    if params[:commit].eql?('Cancel')
      redirect_to :controller => :welcome
    else
      user = current_user
      if user.update_attributes(params[:user])
        flash[:notice] = 'Your updates were saved'
        redirect_to :controller => :welcome
      else
        flash[:notice] = 'Your changes could not be saved'
        render :action => :edit
      end
    end
  end

  def profile

    @user = current_user
    render :action => :edit
  end

end
