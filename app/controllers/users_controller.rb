class UsersController < ApplicationController

  skip_before_action :authorize_request, only: :create
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  # POST /users
  def create
    @user = User.create!(user_params)

    auth_token = AuthenticateUser.new(@user.email, @user.password).call
    response = { message: Message.account_created, auth_token: auth_token }

    # sends email to user when user is created.
    ExampleMailer.sample_email(@user).deliver

    json_response(response, :created)
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

  # PATCH/PUT /users/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # Only allow a trusted parameter "white list" through.
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
