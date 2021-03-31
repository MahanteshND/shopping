class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.new(signup_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
    else
      flash[:notice] = "Form is invalid"
    end
    redirect_to root_path
  end

  private

  def signup_params
    params.require(:user).permit(:first_name,
                                        :last_name,
                                        :email,
                                        :password,
                                        :admin_role,
                                        :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :current_password)
  end
end
