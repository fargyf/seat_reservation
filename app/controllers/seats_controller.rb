class SeatsController < ApplicationController
  # GET /seats
  # GET /seats.json
  def index
    @q = Seat.search(params[:q])
    @seats = @q.result.includes([:area, :type, :state]).page(params[:page])
    @seats = @seats.where(:area_id => params[:area_id]) if params[:area_id]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seats }
    end
  end

  def map
    @area = Area.select([:id, :name, :x_max, :y_max]).find(params[:area_id])
    @seats = Seat.where(:area_id => @area.id).includes([:type, :state])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seats }
    end
  end

  def sort
    Seat.sort params[:seat]
    render :nothing => true
  end

  # GET /seats/1
  # GET /seats/1.json
  def show
    @seat = Seat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @seat }
    end
  end

  # GET /seats/new
  # GET /seats/new.json
  def new
    @seat = Seat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seat }
    end
  end

  # GET /seats/1/edit
  def edit
    @seat = Seat.find(params[:id])
  end

  # POST /seats
  # POST /seats.json
  def create
    @seat = Seat.new(params[:seat])

    respond_to do |format|
      if @seat.save
        format.html { redirect_to @seat, notice: 'Seat was successfully created.' }
        format.json { render json: @seat, status: :created, location: @seat }
      else
        format.html { render action: "new" }
        format.json { render json: @seat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seats/1
  # PUT /seats/1.json
  def update
    @seat = Seat.find(params[:id])

    respond_to do |format|
      if @seat.update_attributes(params[:seat])
        format.html { redirect_to map_seats_path(:area_id => @seat.try(:area).try(:id)), notice: 'Seat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seats/1
  # DELETE /seats/1.json
  def destroy
    @seat = Seat.find(params[:id])
    @seat.destroy

    respond_to do |format|
      format.html { redirect_to seats_url }
      format.json { head :no_content }
    end
  end
end
