class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by_id(params[:id])
    # exit
  end

  def edit
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)

    else
        render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

  public
    def create
      # debugger
      @user = User.new(user_params)
      puts request.method
      if @user.save

        flash[:success] = "Welcome to the Sample App!"
        redirect_to user_url(@user)
      else
          render 'new'
      end

  end


end
