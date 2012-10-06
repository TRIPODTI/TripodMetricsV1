class SessionsController < ApplicationController
  # GET /sessions
  # GET /sessions.json

  # GET /sessions/new
  # GET /sessions/new.json
  def new
    #@session = Session.new

  end

  # GET /sessions/1/edit

  # POST /sessions
  # POST /sessions.json
  def create

    user = Usuario.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success]="Bienvenido a Tripod Metrics"
     else

    #flash.now[:error] = 'Combinación inválida de email/password'
      #usar flash.now en lugar de flash solo, hace que el mensaje no replique en otras páginas.
      render 'new'
    end

  else

    #@session = Session.new(params[:session])

    #respond_to do |format|
     # if @session.save
     #   format.html { redirect_to @session, notice: 'Session was successfully created.' }
     #   format.json { render json: @session, status: :created, location: @session }
     # else
     #   format.html { render action: "new" }
     #   format.json { render json: @session.errors, status: :unprocessable_entity }
     # end
    #end
  end

  # PUT /sessions/1
  # PUT /sessions/1.json


  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy

    sign_out
    redirect_to root_url
    #@session = Session.find(params[:id])
    #@session.destroy

    #respond_to do |format|
    #  format.html { redirect_to sessions_url }
    #  format.json { head :no_content }
    #end
  end
end
