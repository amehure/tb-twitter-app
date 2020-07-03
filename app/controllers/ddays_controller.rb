class DdaysController < ApplicationController
  before_action :set_dday, only: [:show, :destroy, :edit]
  # before_action :set_dday_to_edit, only: [:edit]
  # before_action :permitted_params

  # GET /ddays
  # GET /ddays.json
  def index
    @ddays = Dday.all
  end

  # GET /ddays/1
  # GET /ddays/1.json
  def show
  end

  # GET /ddays/new
  def new
    # p "DdayNewコントローラー"
    @dday = Dday.new
    @event_id = params[:event_id]
    @event = Event.find(params[:event_id]) 
    @event_no = params[:event_no] || @event.event_no
    # @event_no = params[:event_no]
    days_held = @event.days_held
    if days_held.present?
      unless days_held == 1
        array_range = (1..@event.days_held)
        array_event_sub_no = Dday.order(:event_sub_no).pluck(:event_sub_no)
        first_event_sub_no = array_range.map { |n| array_event_sub_no.include?(n) ? n : nil }.index(nil)
        @event_sub_no = first_event_sub_no + 1
      end
      @event_sub_no = 1
    else
      @event_sub_no = 1
    end
  end

  # GET /ddays/1/edit
  def edit
    @dday_id = params[:id]
    @dday = Dday.find(@dday_id)
    @event_id = @dday.event_id
    @event = Event.find(@event_id)
    @event_no = @dday.event_no
    @event_sub_no = @dday.event_sub_no
    @users = User.where(event_no: @event_no).where(event_sub_no: @event_sub_no)
  end

  # POST /ddays
  # POST /ddays.json
  def create
    @dday = Dday.new(dday_params)
    # @event_no = params[:event_id]
    # @event_id = Event.where(event_no: @event_no ).first.id
    respond_to do |format|
      if @dday.save
        format.html { redirect_to event_path(@dday.event_id), notice: 'Dday was successfully created.' }
        format.json { render :show, status: :created, location: @dday }
      else
        @dday = Dday.new(dday_params)
        @event = Event.find(params[:event_id])
        @event_sub_no = @dday.event_sub_no
        @event_no = @dday.event_no
        @event_id = @dday.event_id
        format.html { render :new }
        format.json { render json: @dday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ddays/1
  # PATCH/PUT /ddays/1.json
  def update
    dday_id = params[:id]
    @event_id = Dday.find(dday_id).event_id
    @even = Event.find(@event_id)
    # @event_id = params[:id]
    # @event = Event.find(params[:id])
    respond_to do |format|
      if Dday.update(dday_params)
        format.html { redirect_to event_path(id: @event_id), notice: 'Dday was successfully updated.' }
        format.json { render :show, status: :ok, location: @dday }
      else
        format.html { render :edit }
        format.json { render json: @dday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ddays/1
  # DELETE /ddays/1.json
  def destroy 
    params_id = params[:format]
    dday = Dday.find(params[:id])
    event_id = Event.find(dday.event_id).id
    @dday.destroy
    respond_to do |format|
      format.html { redirect_to event_path(event_id), notice: 'Dday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dday
      @dday = Dday.find(params[:id])
    end

    def set_dday_to_edit
      @dday = Dday.find(params[:format])
    end
    # Only allow a list of trusted parameters through.
    def dday_params
      params.require(:dday).permit(:id, :event_no, :event_sub_no, :event_date, :decision, :max_num, :zoom_id, :zoom_url, :zoom_pass, :event_id, :created_at, :updated_at)
    end
    def permitted_params
      params.permit!
    end
end
