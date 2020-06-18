class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :set_user, only: [:show, :edit, :update]

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
    p "UserNewコントローラー"
    @user = User.new
    @dday = Dday.find(params[:dday_id])
    @event_id = @dday.event_id
    @event = Event.find(@event_id)
    # @id = @event.id
    # @array_size = @dday.max_num
    max_num = @dday.max_num
    array_range = (1..max_num)
    p array_range
    array_serial_no = User.where(event_no: @dday.event_no).where(event_sub_no: @dday.event_sub_no).order(:serial_no).pluck(:serial_no)
    p array_serial_no
    first_serial_no = array_range.map { |n| array_serial_no.include?(n) ? n : nil }.index(nil)
    p first_serial_no
    if first_serial_no.present?
      @serial_no = first_serial_no + 1
    else
      @serial_no = 1
    end
  end

  # GET /users/1/edit
  def edit
    @dday = Dday.find(params[:id])
    event_id = @dday.event_id
    @event = Event.find(event_id)
    @serial_no = User.find(params[:format]).serial_no
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @dday = Dday.find(params[:dday_id])
    @event_id = @dday.event_id
    @event = Event.find(@event_id)
    @id = @event.id
    respond_to do |format|
      if @user.save
        format.html { redirect_to  event_path(@id), notice: 'User was successfully created.' }
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
    @dday = Dday.find(params[:id])
    @event_id = @dday.event_id
    @event = Event.find(@event_id)
    @id = @event.id
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to  event_path(@id), notice: 'User was successfully updated.' }
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
    @params_id = params[:format]
    event_sub_no = User.find(params[:id]).event_sub_no
    @event_id = Dday.find_by(event_sub_no: event_sub_no).event_id
    @user.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@event_id), notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      # params.fetch(:user, {})
      params.require(:user).permit(:event_no, :event_sub_no, :serial_no, :twitter_screenname, :dday_id)
    end
end
