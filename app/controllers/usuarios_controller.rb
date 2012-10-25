class UsuariosController < ApplicationController

  #before_filter :signed_in_user, only: [:create,:edit, :update]
  before_filter :signed_in_user, only: [ :edit, :update]
  #este método signed_in_user está en login helper disponible para toda la
  #aplicación
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: [:index, :destroy]




  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
    $logo="Logo2.png"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usuarios }
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])
    @dispositivos = @usuario.dispositivos
    $logo="Logo2.png"
    @disp = Array.new
    valores  #así se invoca
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /usuarios/new
  # GET /usuarios/new.json
  def new
    @usuario = Usuario.new
    $logo="Logo2.png"
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
    $logo="Logo2.png"
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(params[:usuario])
    $logo="Logo2.png"
     respond_to do |format|
      if @usuario.save
        sign_in @usuario
        #flash[:success]="Bienvenido a Tripod Metrics"
        format.html { redirect_to @usuario, notice: 'Ahora puedes acceder a nuestros servicios.' }
        format.json { render json: @usuario, status: :created, location: @usuario }
      else
        format.html { render action: "new" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /usuarios/1
  # PUT /usuarios/1.json
  def update
    @usuario = Usuario.find(params[:id])
    $logo="Logo2.png"

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        sign_in @usuario
        format.html { redirect_to @usuario, notice: 'Usuario actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario = Usuario.find(params[:id])
    $logo="Logo2.png"
    @usuario.destroy
    flash[:success] = "usuario eliminado"
    respond_to do |format|
      format.html { redirect_to usuarios_url }
      format.json { head :no_content }
    end
  end

  def report_excel
    #headers['Content-Type'] = "application/vnd.ms-excel"
    #headers['Content-Disposition'] = 'attachment; filename="report.xls"'
    #headers['Cache-Control'] = ''
    #@person = Usuario.all
    #@usuarios.to_xls(:id => "ID")

  end

  def reports
    $logo="Logo2.png"
    @fechadiaselected = String.new
    @fechaanoselected = String.new
    $selectdevice = String.new
    @usuario = current_user
    @dispositivos = @usuario.dispositivos
    @disp = Array.new
    valores  #así se invoca
    mediacalc
    @optiondisp = @dispositivos.all.collect {|p| [ p.device_id ] }
             #con esto busco los dispositivos que tiene la variable dispositivos

     if params[:start_date]

       $selectdevice = params[:dispositivo2][:selectdevice2]
       @start_dateano = params[:start_date][:year]
       @start_datemes = params[:start_date][:month]
       @end_dateano = params[:end_date][:year]
       @end_datemes = params[:end_date][:month]


       if @start_datedia.to_i < 10
         @start_datedia = "0"+params[:start_date][:day]
       end
       if  @start_datedia.to_i >= 10
         @start_datedia = params[:start_date][:day]
       end

       if @end_datedia.to_i < 10
         @end_datedia = "0"+params[:end_date][:day]
       end
       if  @end_datedia.to_i >= 10
         @end_datedia = params[:end_date][:day]
       end

       @start_date = Date.new(params[:start_date][:year].to_i,
                              params[:start_date][:month].to_i,
                              params[:start_date][:day].to_i).strftime("%Y-%m-%d 00:00:00")
       @end_date = Date.new(params[:end_date][:year].to_i,
                              params[:end_date][:month].to_i,
                              params[:end_date][:day].to_i).strftime("%Y-%m-%d 23:59:59")

      if params[:alldevice2]
         valoresfiltradofecharango
         if params[:report4]
           require "spreadsheet/excel"
           @report = StringIO.new
           @format = Spreadsheet::Format.new
           @format.font = Spreadsheet::Font.new('Arial', :bold => true)
           @workbook = Spreadsheet::Excel.new(@report)
           @worksheet = @workbook.add_worksheet("Info. SQ")
           @worksheet.write(6, 1, $valore)
           @worksheet.write(7, 1, $valorb)
           @worksheet.write(8, 1, $valoreg)
           @worksheet.write(9, 1, $valorm)
           @worksheet.write(10,1, $valormedia)
           @worksheet.write(6, 0, "Excelentes")
           @worksheet.write(7, 0, "Buenos")
           @worksheet.write(8, 0, "Regulares")
           @worksheet.write(9, 0, "Malos")
           @worksheet.write(10, 0, "Promedio")

           @worksheet.write(0, 0, "Reporte Dispositivos")

           @worksheet.write(1, 0, "Dispositivo")

           @worksheet.write(1, 1, @dispositivos.count)
           @worksheet.write(2, 0, "Desde")
           @worksheet.write(2, 1, @start_date)
           @worksheet.write(3, 0, "Hasta")
           @worksheet.write(3, 1, @end_date)

           @workbook.close
           send_data @report.string, :filename => 'Report.xls', :content_type => "application/xls"
         end

       else
        valoresfiltradofechadisprango
        if params[:report4]
          require "spreadsheet/excel"
          @report = StringIO.new
          @format = Spreadsheet::Format.new
          @format.font = Spreadsheet::Font.new('Arial', :bold => true)
          @workbook = Spreadsheet::Excel.new(@report)
          @worksheet = @workbook.add_worksheet("Info. SQ")
          @worksheet.write(6, 1, $valore)
          @worksheet.write(7, 1, $valorb)
          @worksheet.write(8, 1, $valoreg)
          @worksheet.write(9, 1, $valorm)
          @worksheet.write(10,1, $valormedia)
          @worksheet.write(6, 0, "Excelentes")
          @worksheet.write(7, 0, "Buenos")
          @worksheet.write(8, 0, "Regulares")
          @worksheet.write(9, 0, "Malos")
          @worksheet.write(10, 0, "Promedio")

          @worksheet.write(0, 0, "Reporte Dispositivos")

          @worksheet.write(1, 0, "Dispositivo")

          @worksheet.write(1, 1, $selectdevice)
          @worksheet.write(2, 0, "Desde")
          @worksheet.write(2, 1, @start_date)
          @worksheet.write(3, 0, "Hasta")
          @worksheet.write(3, 1, @end_date)

          @workbook.close
          send_data @report.string, :filename => 'Report.xls', :content_type => "application/xls"
        end
      end

     end

    if  params[:dispositivo]
      $selectdevice = params[:dispositivo][:selectdevice]
      valoresfiltrado
      mediacalcfiltrada
      if params[:report1]
        require "spreadsheet/excel"
        @report = StringIO.new
        @format = Spreadsheet::Format.new
        @format.font = Spreadsheet::Font.new('Arial', :bold => true)
        @workbook = Spreadsheet::Excel.new(@report)
        @worksheet = @workbook.add_worksheet("Info. SQ")
        @worksheet.write(6, 1, $valore)
        @worksheet.write(7, 1, $valorb)
        @worksheet.write(8, 1, $valoreg)
        @worksheet.write(9, 1, $valorm)
        @worksheet.write(10,1, $valormedia)
        @worksheet.write(6, 0, "Excelentes")
        @worksheet.write(7, 0, "Buenos")
        @worksheet.write(8, 0, "Regulares")
        @worksheet.write(9, 0, "Malos")
        @worksheet.write(10, 0, "Promedio")
        @worksheet.write(0, 0, "Reporte Dispositivos")
        @worksheet.write(1, 0, "Dispositivo")
        @worksheet.write(1, 1, $selectdevice)
        @workbook.close
        send_data @report.string, :filename => 'Report.xls', :content_type => "application/xls"
      end

   end

    if  params[:selectdate]
     # @fechaselected =  params[:dateselect]["month(1i)"]
      $selectdevice= params[:dispositivo][:selectdevice2]

      @fechamesselected = params[:selectdate]["fecha(2i)"]
      @fechaanoselected = params[:selectdate]["fecha(1i)"]


      if @fechadiaselected.to_i < 10
        @fechadiaselected = "0"+params[:selectdate]["fecha(3i)"]
           end
      if @fechadiaselected.to_i >= 10
            @fechadiaselected = params[:selectdate]["fecha(3i)"]
      end


      if params[:alldevice]
        valoresfiltradofecha
        mediacalcfiltradafecha

        if params[:report3]
          require "spreadsheet/excel"
          @report = StringIO.new
          @format = Spreadsheet::Format.new
          @format.font = Spreadsheet::Font.new('Arial', :bold => true)
          @workbook = Spreadsheet::Excel.new(@report)
          @worksheet = @workbook.add_worksheet("Info. SQ")
          @worksheet.write(6, 1, $valore)
          @worksheet.write(7, 1, $valorb)
          @worksheet.write(8, 1, $valoreg)
          @worksheet.write(9, 1, $valorm)
          @worksheet.write(10,1, $valormedia)
          @worksheet.write(6, 0, "Excelentes")
          @worksheet.write(7, 0, "Buenos")
          @worksheet.write(8, 0, "Regulares")
          @worksheet.write(9, 0, "Malos")
          @worksheet.write(10, 0, "Promedio")

          @worksheet.write(0, 0, "Reporte Dispositivos")

          @worksheet.write(1, 0, "Dispositivo")

          @worksheet.write(1, 1, @dispositivos.count)
          @worksheet.write(1, 2, "Todos los dispositivos")
          @worksheet.write(2, 0, "Year")
          @worksheet.write(2, 1, @fechaanoselected)
          @worksheet.write(3, 0, "Month")
          @worksheet.write(3, 1, @fechamesselected)
          @worksheet.write(4, 0, "Day")
          @worksheet.write(4, 1, @fechadiaselected)

          @workbook.close
          send_data @report.string, :filename => 'Report.xls', :content_type => "application/xls"
        end
      else
        valoresfiltradofechadisp
        mediacalcfiltradafechadisp
        if params[:report3]
          require "spreadsheet/excel"
          @report = StringIO.new
          @format = Spreadsheet::Format.new
          @format.font = Spreadsheet::Font.new('Arial', :bold => true)
          @workbook = Spreadsheet::Excel.new(@report)
          @worksheet = @workbook.add_worksheet("Info. SQ")
          @worksheet.write(6, 1, $valore)
          @worksheet.write(7, 1, $valorb)
          @worksheet.write(8, 1, $valoreg)
          @worksheet.write(9, 1, $valorm)
          @worksheet.write(10,1, $valormedia)
          @worksheet.write(6, 0, "Excelentes")
          @worksheet.write(7, 0, "Buenos")
          @worksheet.write(8, 0, "Regulares")
          @worksheet.write(9, 0, "Malos")
          @worksheet.write(10, 0, "Promedio")

          @worksheet.write(0, 0, "Reporte Dispositivos")

          @worksheet.write(1, 0, "Dispositivo")

          @worksheet.write(1, 1, $selectdevice)
          @worksheet.write(2, 0, "Year")
          @worksheet.write(2, 1, @fechaanoselected)
          @worksheet.write(3, 0, "Month")
          @worksheet.write(3, 1, @fechamesselected)
          @worksheet.write(4, 0, "Day")
          @worksheet.write(4, 1, @fechadiaselected)


          @workbook.close
          send_data @report.string, :filename => 'Report.xls', :content_type => "application/xls"
        end
      end

    end

    if  params[:messeleccionado]
      @messeleccionado = params[:messeleccionado][:month]

      if params[:alldevices]
        valoresfiltradomes
        mediacalcfiltradames
        if params[:report2]
          require "spreadsheet/excel"
          @report = StringIO.new
          @format = Spreadsheet::Format.new
          @format.font = Spreadsheet::Font.new('Arial', :bold => true)
          @workbook = Spreadsheet::Excel.new(@report)
          @worksheet = @workbook.add_worksheet("Info. SQ")
          @worksheet.write(6, 1, $valore)
          @worksheet.write(7, 1, $valorb)
          @worksheet.write(8, 1, $valoreg)
          @worksheet.write(9, 1, $valorm)
          @worksheet.write(10,1, $valormedia)
          @worksheet.write(6, 0, "Excelentes")
          @worksheet.write(7, 0, "Buenos")
          @worksheet.write(8, 0, "Regulares")
          @worksheet.write(9, 0, "Malos")
          @worksheet.write(10, 0, "Promedio")
          @worksheet.write(0, 0, "Reporte Dispositivos")
          @worksheet.write(1, 0, "Dispositivo")
          @worksheet.write(1, 1, "todos los dispositivos")
          @worksheet.write(1, 2, @dispositivos.count)
          @worksheet.write(2, 0, "Mes")
          @worksheet.write(2, 1, @messeleccionado)
          @workbook.close
          send_data @report.string, :filename => 'Report.xls', :content_type => "application/xls"
        end
      else

        valoresfiltradomesdisp
        mediacalcfiltradamesdisp
        if params[:report2]
          require "spreadsheet/excel"
          @report = StringIO.new
          @format = Spreadsheet::Format.new
          @format.font = Spreadsheet::Font.new('Arial', :bold => true)
          @workbook = Spreadsheet::Excel.new(@report)
          @worksheet = @workbook.add_worksheet("Info. SQ")
          @worksheet.write(4, 0, $valore)
          @worksheet.write(4, 1, $valorb)
          @worksheet.write(4, 2, $valoreg)
          @worksheet.write(4, 3, $valorm)
          @worksheet.write(4, 4, $valormedia)
          @worksheet.write(3, 0, "Excelentes")
          @worksheet.write(3, 1, "Buenos")
          @worksheet.write(3, 2, "Regulares")
          @worksheet.write(3, 3, "Malos")
          @worksheet.write(3, 4, "Promedio")
          @worksheet.write(0, 0, "Reporte Dispositivos")
          @worksheet.write(1, 0, "Dispositivo")
          @worksheet.write(1, 1, $selectdevice)
          @worksheet.write(2, 0, "Mes")
          @worksheet.write(2, 1, @messeleccionado)
          @workbook.close
          send_data @report.string, :filename => 'Report.xls', :content_type => "application/xls"
        end
      end

    end


  end

  def valores
    @contador=0
    $valore=0
    $valorb=0
    $valoreg=0
    $valorm=0
    @valoredate=0
    @valorbdate=0
    @valoregdate=0
    @valormdate=0

      @dispositivos.each do |b|

        @rat= Rate.find_all_by_device_id(b.device_id)

        @rat.each do |p|
          if p.selected_option ==  "E"
            $valore += 1
          end
          if p.selected_option ==  "B"
            $valorb += 1
          end
          if p.selected_option ==  "R"
            $valoreg += 1
          end
          if p.selected_option ==  "M"
            $valorm += 1
          end

        end

      end
    denom =($valore+$valorb+$valoreg+$valorm)
    if denom==0
      $valormedia = 0
    else
      $valormedia = (Float(($valore*5)+($valorb*4)+($valoreg*3)+($valorm*2)))/denom

    end


  end



  def valoresfiltrado
    @contador=0
    $valore=0
    $valorb=0
    $valoreg=0
    $valorm=0
    @valoredate=0
    @valorbdate=0
    @valoregdate=0
    @valormdate=0



    @rat= Rate.find_all_by_device_id($selectdevice)
      #@rat2= @rat.mesint("1")
      @rat.each do |p|
        if p.selected_option ==  "E"
          $valore += 1
        end
        if p.selected_option ==  "B"
          $valorb += 1
        end
        if p.selected_option ==  "R"
          $valoreg += 1
        end
        if p.selected_option ==  "M"
          $valorm += 1
        end

      end

    denom =($valore+$valorb+$valoreg+$valorm)
    if denom==0
      $valormedia = 0
    else
      $valormedia = (Float(($valore*5)+($valorb*4)+($valoreg*3)+($valorm*2)))/denom

    end

  end

  def valoresfiltradomesdisp
    @contador=0
    $valore=0
    $valorb=0
    $valoreg=0
    $valorm=0
    @valoredate=0
    @valorbdate=0
    @valoregdate=0
    @valormdate=0



    @rat = Rate.where(:device_id =>$selectdevice,:mesint => @messeleccionado )
    #@rat2= @rat.mesint("1")
    @rat.each do |p|
      if p.selected_option ==  "E"
        $valore += 1
      end
      if p.selected_option ==  "B"
        $valorb += 1
      end
      if p.selected_option ==  "R"
        $valoreg += 1
      end
      if p.selected_option ==  "M"
        $valorm += 1
      end
    end

    denom =($valore+$valorb+$valoreg+$valorm)
    if denom==0
      $valormedia = 0
    else
      $valormedia = (Float(($valore*5)+($valorb*4)+($valoreg*3)+($valorm*2)))/denom

    end
  end

  def valoresfiltradomes
    @contador=0
    $valore=0
    $valorb=0
    $valoreg=0
    $valorm=0
    @valoredate=0
    @valorbdate=0
    @valoregdate=0
    @valormdate=0

    @dispositivos.each do |b|

      @rat = Rate.where(:device_id =>b.device_id,:mesint => @messeleccionado )
      #@rat2= @rat.mesint("1")
      @rat.each do |p|
        if p.selected_option ==  "E"
          $valore += 1
        end
        if p.selected_option ==  "B"
          $valorb += 1
        end
        if p.selected_option ==  "R"
          $valoreg += 1
        end
        if p.selected_option ==  "M"
          $valorm += 1
        end

      end
    end

    denom =($valore+$valorb+$valoreg+$valorm)
    if denom==0
      $valormedia = 0
    else
      $valormedia = (Float(($valore*5)+($valorb*4)+($valoreg*3)+($valorm*2)))/denom

    end
  end
  def valoresfiltradofecha
    @contador=0
    $valore=0
    $valorb=0
    $valoreg=0
    $valorm=0
    @valoredate=0
    @valorbdate=0
    @valoregdate=0
    @valormdate=0

    @dispositivos.each do |b|

      @rat = Rate.where(:device_id =>b.device_id,:mesint => @fechamesselected, :ano => @fechaanoselected, :dia => @fechadiaselected )
      #@rat2= @rat.mesint("1")
      @rat.each do |p|
        if p.selected_option ==  "E"
          $valore += 1
        end
        if p.selected_option ==  "B"
          $valorb += 1
        end
        if p.selected_option ==  "R"
          $valoreg += 1
        end
        if p.selected_option ==  "M"
          $valorm += 1
        end

      end
    end

    denom =($valore+$valorb+$valoreg+$valorm)
    if denom==0
      $valormedia = 0
    else
      $valormedia = (Float(($valore*5)+($valorb*4)+($valoreg*3)+($valorm*2)))/denom

    end
  end


  def valoresfiltradofechadisp
    @contador=0
    $valore=0
    $valorb=0
    $valoreg=0
    $valorm=0
    @valoredate=0
    @valorbdate=0
    @valoregdate=0
    @valormdate=0



      @rat = Rate.where(:device_id =>$selectdevice, :ano => @fechaanoselected, :mesint => @fechamesselected, :dia => @fechadiaselected)
      #@rat2= @rat.mesint("1")
      @rat.each do |p|
        if p.selected_option ==  "E"
          $valore += 1
        end
        if p.selected_option ==  "B"
          $valorb += 1
        end
        if p.selected_option ==  "R"
          $valoreg += 1
        end
        if p.selected_option ==  "M"
          $valorm += 1
        end

    end

    denom =($valore+$valorb+$valoreg+$valorm)
    if denom==0
      $valormedia = 0
    else
      $valormedia = (Float(($valore*5)+($valorb*4)+($valoreg*3)+($valorm*2)))/denom

    end
  end
  def valoresfiltradofecharango
    @contador=0
    $valore=0
    $valorb=0
    $valoreg=0
    $valorm=0
    @valoredate=0
    @valorbdate=0
    @valoregdate=0
    @valormdate=0

    @dispositivos.each do |b|

      @rat = Rate.where(:device_id =>b.device_id,:created_at =>  @start_date..@end_date)
      #@rat2= @rat.mesint("1")
      @rat.each do |p|
        if p.selected_option ==  "E"
          $valore += 1
        end
        if p.selected_option ==  "B"
          $valorb += 1
        end
        if p.selected_option ==  "R"
          $valoreg += 1
        end
        if p.selected_option ==  "M"
          $valorm += 1
        end

      end
    end

    denom =($valore+$valorb+$valoreg+$valorm)
    if denom==0
      $valormedia = 0
    else
      $valormedia = (Float(($valore*5)+($valorb*4)+($valoreg*3)+($valorm*2)))/denom

    end
  end

  def valoresfiltradofechadisprango
    @contador=0
    $valore=0
    $valorb=0
    $valoreg=0
    $valorm=0
    @valoredate=0
    @valorbdate=0
    @valoregdate=0
    @valormdate=0



    @rat = Rate.where(:device_id => $selectdevice, :created_at =>  @start_date..@end_date)
    #@rat2= @rat.mesint("1")
    @rat.each do |p|
      if p.selected_option ==  "E"
        $valore += 1
      end
      if p.selected_option ==  "B"
        $valorb += 1
      end
      if p.selected_option ==  "R"
        $valoreg += 1
      end
      if p.selected_option ==  "M"
        $valorm += 1
      end

    end

    denom =($valore+$valorb+$valoreg+$valorm)
    if denom==0
      $valormedia = 0
    else
      $valormedia = (Float(($valore*5)+($valorb*4)+($valoreg*3)+($valorm*2)))/denom

    end
  end
  def mediacalc
    #@ratemonth = Rate.find(@dispositivos).selected_option # => { "background" => "black", "display" => large }
    @conteomonth=0
    @valormediames= Hash.new
    @totalcalifmes = Array.new
    @equantity = Array.new
    @bquantity = Array.new
    @rquantity  = Array.new
    @mquantity  = Array.new
    @dispmedia = Array.new([0,0,0,0,0,0,0,0,0,0,0,0])

    if @dispositivos.count >= 1
      @indicegrafica = 1
    else
      @indicegrafica = 0
    end
    #este indice me dice que linea de que dispositivo voy a mostrar.. si no hay dispositivos, se muestra todo en cero
    #si hay dispositivos, se muestra el primero.

    #el array contiene los promedio del disp 1, un segundo arra y con los promedio del 2 etc...
    #cuidado con la forma como direcciono los datos en el show parte de la gráfica de tendencia.

    @contadordispositivos = 0

    @dispositivos.each do |n|
       (1..12).each do |i|
        @equantity << 5*Rate.where(:device_id =>n.device_id,:selected_option => "E", :mesint => i,:ano => '2012'  ).count
        @bquantity  << 4*Rate.where(:device_id => n.device_id,:ano => '2012', :mesint => 1,:selected_option => "B" ).count
        @rquantity  << 3*Rate.where(:device_id => n.device_id,:ano => '2012', :mesint => 1,:selected_option => "R" ).count
        @mquantity  << 2*Rate.where(:device_id => n.device_id,:ano => '2012', :mesint => 1,:selected_option => "M" ).count

        end

        @splitdispe =  @equantity .in_groups_of(12)
        @splitdispb =  @bquantity .in_groups_of(12)
        @splitdispr =  @rquantity .in_groups_of(12)
        @splitdispm=  @mquantity .in_groups_of(12)

        @contadordispositivos =+1
    end
    for i in 0..@contadordispositivos
      for j in 0..11
        begin

          denom = (((@splitdispe[i][j])/5) + ((@splitdispb[i][j])/4) + ((@splitdispr[i][j])/3) + ((@splitdispm[i][j])/2))
          if denom == 0
            @dispmedia << 0
          else
            @dispmedia << (@splitdispe[i][j]+@splitdispb[i][j]+@splitdispr[i][j]+@splitdispm[i][j]) / denom
          #este ES UN ARRAY QUE CONTIENE LA MEDIA DE CADA MES PARA CADA DISPOSITIVO
          end

        rescue Exception
          0.0
        end
      end
    end
    @dispmedia= @dispmedia.in_groups_of(12)
  end

  def mediacalcfiltrada
    #@ratemonth = Rate.find(@dispositivos).selected_option # => { "background" => "black", "display" => large }
    @conteomonth=0
    @valormediames= Hash.new
    @totalcalifmes = Array.new
    @equantity = Array.new
    @bquantity = Array.new
    @rquantity  = Array.new
    @mquantity  = Array.new
    @dispmedia = Array.new([0,0,0,0,0,0,0,0,0,0,0,0])

    #este indice me dice que linea de que dispositivo voy a mostrar.. si no hay dispositivos, se muestra todo en cero
    #si hay dispositivos, se muestra el primero.

    #el array contiene los promedio del disp 1, un segundo arra y con los promedio del 2 etc...
    #cuidado con la forma como direcciono los datos en el show parte de la gráfica de tendencia.

    @contadordispositivos = 0


    (1..12).each do |i|
      @equantity << 5*Rate.where(:device_id =>$selectdevice,:selected_option => "E", :mesint => i,:ano => '2012'  ).count
      @bquantity  << 4*Rate.where(:device_id => $selectdevice,:ano => '2012', :mesint => i,:selected_option => "B" ).count
      @rquantity  << 3*Rate.where(:device_id => $selectdevice,:ano => '2012', :mesint => i,:selected_option => "R" ).count
      @mquantity  << 2*Rate.where(:device_id => $selectdevice,:ano => '2012', :mesint => i,:selected_option => "M" ).count

    end

      @splitdispe =  @equantity .in_groups_of(12)
      @splitdispb =  @bquantity .in_groups_of(12)
      @splitdispr =  @rquantity .in_groups_of(12)
      @splitdispm=  @mquantity .in_groups_of(12)

      @contadordispositivos =+1

    for i in 0..@contadordispositivos
      for j in 0..11
        begin

          denom = (((@splitdispe[i][j])/5) + ((@splitdispb[i][j])/4) + ((@splitdispr[i][j])/3) + ((@splitdispm[i][j])/2))
          if denom == 0
            @dispmedia << 0
          else
            @dispmedia << Float(@splitdispe[i][j]+@splitdispb[i][j]+@splitdispr[i][j]+@splitdispm[i][j]) / denom
            #este ES UN ARRAY QUE CONTIENE LA MEDIA DE CADA MES PARA CADA DISPOSITIVO
          end

        rescue Exception
          0.0
        end
      end
    end
    @dispmedia= @dispmedia.in_groups_of(12)
  end

  def mediacalcfiltradamesdisp
    #@ratemonth = Rate.find(@dispositivos).selected_option # => { "background" => "black", "display" => large }
    @conteomonth=0
    @valormediames= Hash.new
    @totalcalifmes = Array.new
    @equantity = Array.new
    @bquantity = Array.new
    @rquantity  = Array.new
    @mquantity  = Array.new
    @dispmedia = Array.new([0,0,0,0,0,0,0,0,0,0,0,0])


    #este indice me dice que linea de que dispositivo voy a mostrar.. si no hay dispositivos, se muestra todo en cero
    #si hay dispositivos, se muestra el primero.

    #el array contiene los promedio del disp 1, un segundo arra y con los promedio del 2 etc...
    #cuidado con la forma como direcciono los datos en el show parte de la gráfica de tendencia.

    @contadordispositivos = 0


    (1..12).each do |i|
      @equantity << 5*Rate.where(:device_id =>$selectdevice,:selected_option => "E", :mesint => @messeleccionado,:ano => '2012'  ).count
      @bquantity  << 4*Rate.where(:device_id => $selectdevice,:ano => '2012', :mesint => @messeleccionado,:selected_option => "B" ).count
      @rquantity  << 3*Rate.where(:device_id =>$selectdevice,:ano => '2012', :mesint => @messeleccionado,:selected_option => "R" ).count
      @mquantity  << 2*Rate.where(:device_id => $selectdevice,:ano => '2012', :mesint => @messeleccionado,:selected_option => "M" ).count

    end

    @splitdispe =  @equantity .in_groups_of(12)
    @splitdispb =  @bquantity .in_groups_of(12)
    @splitdispr =  @rquantity .in_groups_of(12)
    @splitdispm=  @mquantity .in_groups_of(12)

    @contadordispositivos =+1

    for i in 0..@contadordispositivos
      for j in 0..11
        begin

          denom = (((@splitdispe[i][j])/5) + ((@splitdispb[i][j])/4) + ((@splitdispr[i][j])/3) + ((@splitdispm[i][j])/2))
          if denom == 0
            @dispmedia << 0
          else
            @dispmedia << Float(@splitdispe[i][j]+@splitdispb[i][j]+@splitdispr[i][j]+@splitdispm[i][j]) / denom
            #este ES UN ARRAY QUE CONTIENE LA MEDIA DE CADA MES PARA CADA DISPOSITIVO
          end

        rescue Exception
          0.0
        end
      end
    end
    @dispmedia= @dispmedia.in_groups_of(12)
  end

  def mediacalcfiltradames
    #@ratemonth = Rate.find(@dispositivos).selected_option # => { "background" => "black", "display" => large }
    @conteomonth=0
    @valormediames= Hash.new
    @totalcalifmes = Array.new
    @equantity = Array.new
    @bquantity = Array.new
    @rquantity  = Array.new
    @mquantity  = Array.new
    @dispmedia = Array.new([0,0,0,0,0,0,0,0,0,0,0,0])


    #este indice me dice que linea de que dispositivo voy a mostrar.. si no hay dispositivos, se muestra todo en cero
    #si hay dispositivos, se muestra el primero.

    #el array contiene los promedio del disp 1, un segundo arra y con los promedio del 2 etc...
    #cuidado con la forma como direcciono los datos en el show parte de la gráfica de tendencia.

    @contadordispositivos = 0
    @dispositivos.each do |n|
      (1..12).each do |i|
        @equantity << 5*Rate.where(:device_id =>n.device_id,:selected_option => "E", :mesint => @messeleccionado,:ano => '2012'  ).count
        @bquantity  << 4*Rate.where(:device_id => n.device_id,:ano => '2012', :mesint => @messeleccionado,:selected_option => "B" ).count
        @rquantity  << 3*Rate.where(:device_id => n.device_id,:ano => '2012', :mesint => @messeleccionado,:selected_option => "R" ).count
        @mquantity  << 2*Rate.where(:device_id => n.device_id,:ano => '2012', :mesint => @messeleccionado,:selected_option => "M" ).count

      end
    end



    @splitdispe =  @equantity .in_groups_of(12)
    @splitdispb =  @bquantity .in_groups_of(12)
    @splitdispr =  @rquantity .in_groups_of(12)
    @splitdispm=  @mquantity .in_groups_of(12)

    @contadordispositivos =+1

    for i in 0..@contadordispositivos
      for j in 0..11
        begin

          denom = (((@splitdispe[i][j])/5) + ((@splitdispb[i][j])/4) + ((@splitdispr[i][j])/3) + ((@splitdispm[i][j])/2))
          if denom == 0
            @dispmedia << 0
          else
            @dispmedia << Float(@splitdispe[i][j]+@splitdispb[i][j]+@splitdispr[i][j]+@splitdispm[i][j]) / denom
            #este ES UN ARRAY QUE CONTIENE LA MEDIA DE CADA MES PARA CADA DISPOSITIVO
          end

        rescue Exception
          0.0
        end
      end
    end
    @dispmedia= @dispmedia.in_groups_of(12)
  end
  def mediacalcfiltradafecha
    #@ratemonth = Rate.find(@dispositivos).selected_option # => { "background" => "black", "display" => large }
    @conteomonth=0
    @valormediames= Hash.new
    @totalcalifmes = Array.new
    @equantity = Array.new
    @bquantity = Array.new
    @rquantity  = Array.new
    @mquantity  = Array.new
    @dispmedia = Array.new([0,0,0,0,0,0,0,0,0,0,0,0])


    #este indice me dice que linea de que dispositivo voy a mostrar.. si no hay dispositivos, se muestra todo en cero
    #si hay dispositivos, se muestra el primero.

    #el array contiene los promedio del disp 1, un segundo arra y con los promedio del 2 etc...
    #cuidado con la forma como direcciono los datos en el show parte de la gráfica de tendencia.

    @contadordispositivos = 0

    @dispositivos.each do |n|
        (1..12).each do |i|
        @equantity << 5*Rate.where(:device_id =>n.device_id,:selected_option => "E",:dia => @fechadiaselected, :mesint => @fechamesselected,:ano => @fechaanoselected  ).count
        @bquantity  << 4*Rate.where(:device_id => n.device_id,:ano => @fechaanoselected, :mesint => @fechamesselected,:dia => @fechadiaselected,:selected_option => "B" ).count
        @rquantity  << 3*Rate.where(:device_id => n.device_id,:ano => @fechaanoselected, :mesint => @fechamesselected,:dia => @fechadiaselected,:selected_option => "R" ).count
        @mquantity  << 2*Rate.where(:device_id => n.device_id,:ano => @fechaanoselected, :mesint => @fechamesselected,:dia => @fechadiaselected,:selected_option => "M" ).count

      end

      @splitdispe =  @equantity .in_groups_of(12)
      @splitdispb =  @bquantity .in_groups_of(12)
      @splitdispr =  @rquantity .in_groups_of(12)
      @splitdispm=  @mquantity .in_groups_of(12)

      @contadordispositivos =+1
    end
    for i in 0..@contadordispositivos
      for j in 0..11
        begin

          denom = (((@splitdispe[i][j])/5) + ((@splitdispb[i][j])/4) + ((@splitdispr[i][j])/3) + ((@splitdispm[i][j])/2))
          if denom == 0
            @dispmedia << 0
          else
            @dispmedia << Float(@splitdispe[i][j]+@splitdispb[i][j]+@splitdispr[i][j]+@splitdispm[i][j]) / denom
            #este ES UN ARRAY QUE CONTIENE LA MEDIA DE CADA MES PARA CADA DISPOSITIVO
          end

        rescue Exception
          0.0
        end
      end
    end
    @dispmedia= @dispmedia.in_groups_of(12)
  end

  def mediacalcfiltradafechadisp
    #@ratemonth = Rate.find(@dispositivos).selected_option # => { "background" => "black", "display" => large }
    @conteomonth=0
    @valormediames= Hash.new
    @totalcalifmes = Array.new
    @equantity = Array.new
    @bquantity = Array.new
    @rquantity  = Array.new
    @mquantity  = Array.new
    @dispmedia = Array.new([0,0,0,0,0,0,0,0,0,0,0,0])


    #este indice me dice que linea de que dispositivo voy a mostrar.. si no hay dispositivos, se muestra todo en cero
    #si hay dispositivos, se muestra el primero.

    #el array contiene los promedio del disp 1, un segundo arra y con los promedio del 2 etc...
    #cuidado con la forma como direcciono los datos en el show parte de la gráfica de tendencia.

    @contadordispositivos = 0


      (1..12).each do |i|
        @equantity << 5*Rate.where(:device_id =>$selectdevice,:selected_option => "E",:dia => @fechadiaselected, :mesint => @fechamesselected,:ano => @fechaanoselected  ).count
        @bquantity  << 4*Rate.where(:device_id => $selectdevice,:ano => @fechaanoselected, :mesint => @fechamesselected,:dia => @fechadiaselected,:selected_option => "B" ).count
        @rquantity  << 3*Rate.where(:device_id => $selectdevice,:ano => @fechaanoselected, :mesint => @fechamesselected,:dia => @fechadiaselected,:selected_option => "R" ).count
        @mquantity  << 2*Rate.where(:device_id => $selectdevice,:ano => @fechaanoselected, :mesint => @fechamesselected,:dia => @fechadiaselected,:selected_option => "M" ).count

      end

      @splitdispe =  @equantity .in_groups_of(12)
      @splitdispb =  @bquantity .in_groups_of(12)
      @splitdispr =  @rquantity .in_groups_of(12)
      @splitdispm=  @mquantity .in_groups_of(12)

      @contadordispositivos =+1

    for i in 0..@contadordispositivos
      for j in 0..11
        begin

          denom = (((@splitdispe[i][j])/5) + ((@splitdispb[i][j])/4) + ((@splitdispr[i][j])/3) + ((@splitdispm[i][j])/2))
          if denom == 0
            @dispmedia << 0
          else
            @dispmedia << Float(@splitdispe[i][j]+@splitdispb[i][j]+@splitdispr[i][j]+@splitdispm[i][j]) / denom
            #este ES UN ARRAY QUE CONTIENE LA MEDIA DE CADA MES PARA CADA DISPOSITIVO
          end

        rescue Exception
          0.0
        end
      end
    end
    @dispmedia= @dispmedia.in_groups_of(12)
  end
 helper_method :current_user


 private
  def correct_user
    @usuario = Usuario.find(params[:id])
    redirect_to(root_path) unless current_usuario?(@usuario)
  end

end
