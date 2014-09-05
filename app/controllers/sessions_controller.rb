class SessionsController < Devise::SessionsController
  def create
    # resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    # set_flash_message(:notice, :signed_in) if is_navigational_format?
    

    respond_to do |format|
      format.html do
        super
      end
      format.json do
        user = params[:user]
        email, password = user[:email], user[:password] if user

        @user = User.find_by_email(email.downcase)
        if @user.nil?
          render status: 401, json: {message: "Invalid email or password" }
          return
        end
        @user.ensure_authentication_token!
        if not @user.valid_password?(password)
          logger.info("User #{email} failed signin, password is invalid")
          render :status=>401, :json=>{:message=>"Invalid email or password."}
        else
          render json: {auth_token: @user.authentication_token}, status: :created
        end
      end
    end
  end

  def destroy
    respond_to do |format|
      format.html do
        super
      end
      format.json do
        auth_token = ActionController::HttpAuthentication::Token.token_and_options(request)
        @user = User.find_by_authentication_token(auth_token.first)
        @user.reset_authentication_token!
        render status: :ok, json: {status: :ok}
      end
    end
  end
end