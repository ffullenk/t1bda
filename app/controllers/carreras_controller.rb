class CarrerasController < ApplicationController
  # GET /carreras
  # GET /carreras.json
  def index
    @carreras = Carrera.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carreras }
      format.xml { render :xml => @carreras.to_xml }
    end
  end

  # GET /carreras/1
  # GET /carreras/1.json
  def show
    @carrera = Carrera.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @carrera }
      format.xml { render :xml => @carrera.to_xml }
    end
  end

  # GET /carreras/new
  # GET /carreras/new.json
  def new
    @carrera = Carrera.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @carrera }
    end
  end

  # GET /carreras/1/edit
  def edit
    @carrera = Carrera.find(params[:id])
  end

  # POST /carreras
  # POST /carreras.json
  def create
    @carrera = Carrera.new(params[:carrera])

    respond_to do |format|
      if @carrera.save
        format.html { redirect_to @carrera, notice: 'Carrera was successfully created.' }
        format.json { render json: @carrera, status: :created, location: @carrera }
      else
        format.html { render action: "new" }
        format.json { render json: @carrera.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carreras/1
  # PUT /carreras/1.json
  def update
    @carrera = Carrera.find(params[:id])

    respond_to do |format|
      if @carrera.update_attributes(params[:carrera])
        format.html { redirect_to @carrera, notice: 'Carrera was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @carrera.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carreras/1
  # DELETE /carreras/1.json
  def destroy
    @carrera = Carrera.find(params[:id])
    @carrera.destroy

    respond_to do |format|
      format.html { redirect_to carreras_url }
      format.json { head :no_content }
    end
  end
end
