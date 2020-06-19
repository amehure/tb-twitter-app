class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    event_id = Event.find(params[:id]).event_no
    @dday = Dday.where(event_no: event_id) || []
    if @dday.present?
      if @dday.count == 1
        @col_range = [*(1..@dday[0].max_num)]
      else
        @col_range = [*(1..@dday.pluck(:max_num).max)]
      end
      @max_col = @dday.pluck(:max_num).max >= 5 ? @dday.pluck(:max_num).max : 5
    else
      @col_range = []
      @max_col = 5
    end
  end

  # GET /events/new
  def new
    @event = Event.new(multiple_entries: false)
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    # @dday = Dday.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    # @event_no = params[:event_id]
    # @event_id = Event.where(event_no: @event_no ).first.id
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        # format.html { redirect_to event_path(id: @event_id), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:event_name, :contents, :days_held, :organizar, :deadline, :multiple_entries, :event_no)
    end
end
