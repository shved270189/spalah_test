class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def login
  end

  def logout
    session['user_id'] = nil
    cookies.signed[:email] = nil
    cookies.signed[:password] = nil
    redirect_to root_path
  end

  def auth
    @user = User.find_by(email: params[:email])
    if @user.blank?
      flash[:notice] = 'Email not found'
      redirect_to login_users_path
    elsif @user.authenticate(params[:password])
      session['user_id'] = @user.id
      if params[:remeber_me]
        cookies.signed[:email] = { value: params[:email], expires: 30.days.from_now }
        cookies.signed[:password] = { value: params[:password], expires: 30.days.from_now }
      end
      redirect_to root_path
    else
      flash[:notice] = 'Password is not valid'
      redirect_to login_users_path
    end


  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :email)
    end
end
