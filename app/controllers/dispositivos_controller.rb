class DispositivosController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :create, :destroy, :show]
  before_filter :admin_user, only: [:edit,:index, :destroy]
  #chequeamos que esé logiado
  #está en logins Helper



  # GET /dispositivos
  # GET /dispositivos.json
  def index
    @dispositivos = Dispositivo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dispositivos }
    end
  end

  # GET /dispositivos/1
  # GET /dispositivos/1.json
  def show

    @dispositivo = Dispositivo.find(params[:id])
    @dispositivo_id = @dispositivo.device_id
    @califica = Rate.find_all_by_device_id(@dispositivo_id)
    #@cali = @califica.find(params[selected_option: "E"])


    respond_to do |format|
      format.html #show.html.erb
      #format.html usuario_path
      format.json { render json: @dispositivo }
    end
  end

  # GET /dispositivos/new
  # GET /dispositivos/new.json
  def new
    @dispositivo = Dispositivo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dispositivo }
    end
  end

  # GET /dispositivos/1/edit
  def edit
    @dispositivo = Dispositivo.find(params[:id])
    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @dispositivos }
    end
  end

  # POST /dispositivos
  # POST /dispositivos.json
  def create
   @dispositivo = Dispositivo.new(params[:dispositivo])
    @dispositivo = current_user.dispositivos.build(params[:dispositivo])
    #@dispositivo = current_usuario.dispositivos.build(params[:dispositivo])
    respond_to do |format|
      if @dispositivo.save
        format.html { redirect_to @dispositivo, notice: 'Dispositivo was successfully created.' }
        #format.json { render json: , status: :created, location: @usuario }
      else
        format.html { render action: "new" }
        format.json { render json: @dispositivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dispositivos/1
  # PUT /dispositivos/1.json
  def update
    @dispositivo = Dispositivo.find(params[:id])

    respond_to do |format|
      if @dispositivo.update_attributes(params[:dispositivo])
        format.html { redirect_to @dispositivo, notice: 'Dispositivo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dispositivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispositivos/1
  # DELETE /dispositivos/1.json
  def destroy
    @dispositivo = Dispositivo.find(params[:id])
    @dispositivo.destroy

    respond_to do |format|
      format.html { redirect_to dispositivos_url }
      format.json { head :no_content }
    end
  end
end
