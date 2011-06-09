class UsersController < ApplicationController
  before_filter :authenticate_user!

  layout 'application'

  def new
    user = User.new
  end

  def create
    if params[:commit].eql?('Cancel')
      redirect_to :controller => :welcome
    else
      @role = Role.find_by_name('consumer')
      @user = User.create(params[:user])
      @user.role = @role
      respond_to do |format|
        if @user.save
          format.html { redirect_to('merchant_offers_path(@merchant)'/'', :notice => 'User was successfully created.') }
        else
          flash[:error] = @user.errors
          format.html { render :action => "new" }
        end
      end



    end
  end

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
