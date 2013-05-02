# encoding: UTF-8
class SedesController < ApplicationController



    def buscar
    @sedes = Sede.search(params[:search])
  end

  
  # GET /sedes
  # GET /sedes.json
  def index
    @sedes = Sede.all



            builder = Nokogiri::XML::Builder.new do |xml|

            xml.sedes {
                @sedes.each do |c|
                    xml.sede do
                      xml.nombre c.nombre
                      xml.ciudad c.ciudad
                      
                end
              end
            }
        end


     data_table = GoogleVisualr::DataTable.new


  # Add Column Headers
data_table.new_column('string', 'Sede' )
data_table.new_column('number', 'Promedio Años Acreditación')


# Add Rows and Values

@sedes.each do |s|
    carreras = s.carreras

    if (carreras.count > 0) 
    cantAnios = 0

    carreras.each do |c|
      cantAnios += c.cantidadAniosAcreditada
    end

    prom = cantAnios / carreras.count


    data_table.add_rows([[s.nombre + " - "+ s.universidad.nombre, prom]])

  end
end



option = { width: 700, height: 300, title: 'Promedio Año de Acreditación por Sede' }
@chart = GoogleVisualr::Interactive::PieChart.new(data_table, option)



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sedes }
      format.xml { render :xml => builder.to_xml }
    end
  end

  # GET /sedes/1
  # GET /sedes/1.json
  def show
    @sede = Sede.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sede }
      format.xml { render :xml => @sede.to_xml }
    end
  end

  # GET /sedes/new
  # GET /sedes/new.json
  def new
    @sede = Sede.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sede }
    end
  end

  # GET /sedes/1/edit
  def edit
    @sede = Sede.find(params[:id])
  end

  # POST /sedes
  # POST /sedes.json
  def create
    @sede = Sede.new(params[:sede])

    respond_to do |format|
      if @sede.save
        format.html { redirect_to @sede, notice: 'Sede was successfully created.' }
        format.json { render json: @sede, status: :created, location: @sede }
      else
        format.html { render action: "new" }
        format.json { render json: @sede.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sedes/1
  # PUT /sedes/1.json
  def update
    @sede = Sede.find(params[:id])

    respond_to do |format|
      if @sede.update_attributes(params[:sede])
        format.html { redirect_to @sede, notice: 'Sede was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sede.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sedes/1
  # DELETE /sedes/1.json
  def destroy
    @sede = Sede.find(params[:id])
    @sede.destroy

    respond_to do |format|
      format.html { redirect_to sedes_url }
      format.json { head :no_content }
    end
  end
end