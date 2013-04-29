class HomeController< ApplicationController

  def index
  end


def exportar

    @universidades = Universidad.all
    @sedes = Sede.all
    @carreras = Carrera.all




builder = Nokogiri::XML::Builder.new do |xml|
xml.acreditacion {
  xml.universidades {
    @universidades.each do |u|
    xml.universidad do
      xml.nombre u.nombre
      xml.sedes {
        u.sedes.each do |s|
            xml.sede do
            xml.nombre s.nombre
            xml.ciudad s.ciudad
            xml.carreras {
                s.carreras.each do |c|
                    xml.carrera do
                    xml.nombre c.nombre
                    xml.codigo c.codigo
                    xml.cantidadAniosAcreditada c.cantidadAniosAcreditada
                    xml.capacidadAutoregulacion c.capacidadAutoregulacion
                    xml.condicionOperacion c.condicionOperacion
                    xml.perfilIngresoResultado c.perfilIngresoResultado
                end
            end
            }
        end
    end
      }
    end
end
  }
}
end



    respond_to do |format|
        format.xml { render :xml => builder.to_xml }
    end




end

end