class CompUsersController < ApplicationController
  before_action :set_comp_user, only: [:show, :update, :destroy]

  # GET /comp_users
  def index
    @comp_users = CompUser.all

    render json: @comp_users
  end

  # GET /comp_users/1
  def show
    render json: @comp_user
  end

  # POST /comp_users
  def create
    @comp_user = CompUser.new(comp_user_params)

    if @comp_user.save
      render json: @comp_user, status: :created, location: @comp_user
    else
      render json: @comp_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comp_users/1
  def update
    if @comp_user.update(comp_user_params)
      render json: @comp_user
    else
      render json: @comp_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comp_users/1
  def destroy
    @comp_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comp_user
      @comp_user = CompUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comp_user_params
      params.require(:comp_user).permit(:email, :username, :password_digest, :permission, :fname, :lname, :company_id)
    end
end
