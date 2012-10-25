class RatesController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :show]
  before_filter :admin_user, only: [:destroy, :index]
  # GET /rates
  # GET /rates.json
  def index
    @rates = Rate.all

    #@rate = Rate.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rates }
    end


  end

  # GET /rates/1
  # GET /rates/1.json
  def show

    @rate = Rate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rate }
    end
  end

  # GET /rates/new
  # GET /rates/new.json
  def new
    @rate = Rate.new
    #respond_to do |format|
     #format.html # new.html.erb
     #format.json { render json: @rate }
    #end
  end

  # GET /rates/1/edit
  def edit
    #@rate = Rate.find(params[:id])
  end

  # POST /rates
  # POST /rates.json

  def create
    if params[:rate][:selected_option] == "E"
      params[:rate][:valor] = 5
    end
    if params[:rate][:selected_option] == "B"
      params[:rate][:valor] = 4
    end
    if params[:rate][:selected_option] == "R"
      params[:rate][:valor] = 3
    end
    if params[:rate][:selected_option] == "M"
      params[:rate][:valor] = 2
      @userid=Dispositivo.find_by_device_id(params[:rate][:device_id]).usuario_id
      @user = Usuario.find(@userid)
      @device= params[:rate][:device_id]
      UserMailer.welcome_email(@user).deliver
    end
    time = Time.now
    params[:rate][:mesint] = time.strftime("%m")
    params[:rate][:ano] = time.strftime("%Y")
    params[:rate][:dia] = time.strftime("%d")
    params[:rate][:hora] = time.strftime("%H")
    #params[:rate][:mesint] = 9
    #params[:rate][:ano] = 2012
    #params[:rate][:dia] = "15"
    #params[:rate][:hora] = 12

    @rate = Rate.new(params[:rate])

    respond_to do |format|

    if @rate.save
      #format.html { redirect_to @rate, notice: 'Usuario was successfully created.' }
      #format.json { render json: @rate, status: :created, location: @rate }
      #render :xml => "<success/>"

    else
        #format.html { render action: "new" }
        #format.json { render json: @rate.errors, status: :unprocessable_entity }
    end

    end

  end


  # PUT /rates/1
  # PUT /rates/1.json
  def update
    @rate = Rate.find(params[:id])

    respond_to do |format|
      if @rate.update_attributes(params[:rate])
        format.html { redirect_to @rate, notice: 'Rate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rates/1
  # DELETE /rates/1.json
  def destroy
    @rate = Rate.find(params[:id])
    @rate.destroy

    respond_to do |format|
      format.html { redirect_to rates_url }
      format.json { head :no_content }
    end
  end
end
