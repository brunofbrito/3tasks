class UsersController < Clearance::UsersController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.update(params[:id], edit_user_params)
    @user.save
    redirect_to edit_user_path
  end

  def background
    backgrounds = Dir.glob("app/assets/images/bground/**/*")
    @backgrounds = backgrounds.map do |x|
      x.slice(3..10) + x.slice(18..-1)
    end
    # /assets/bground/1.jpg
  end

  private

  def edit_user_params
    params.require(:user).permit(:name, :email, :password, :avatar)
  end

  end
