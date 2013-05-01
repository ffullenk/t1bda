# encoding: UTF-8
class HomeController< ApplicationController
  require 'open-uri'
  def index
  end


def importar

  xsd = Nokogiri::XML::Schema(open('http://'+request.host_with_port+'/schema.xsd').read)

  xml_doc  = Nokogiri::XML(params[:archivo][:archivo])


  result =  xsd.valid?(xml_doc)
  
  if !result
    flash[:error] = "Archivo es inválido"
  else
    Universidad.delete_all
    Sede.delete_all
    Carrera.delete_all

    universidades_xml = xml_doc.xpath('//universidad')

    universidades_xml.each do |u|
      universidad = Universidad.new
      universidad.nombre = u.at_xpath("nombre").content
      universidad.save
      sedes_xml = u.xpath(".//sede")

      sedes_xml.each do |s|
        sede = Sede.new
        sede.nombre = s.at_xpath("nombre").content
        sede.ciudad = s.at_xpath("ciudad").content
        sede.universidad_id = universidad.id
        sede.save
        carreras_xml = s.xpath(".//carrera")

        carreras_xml.each do |c|
          carrera = Carrera.new
          carrera.nombre = c.at_xpath("nombre").content
          carrera.codigo = c.at_xpath("codigo").content
          carrera.cantidadAniosAcreditada = c.at_xpath("cantidadAniosAcreditada").content
          carrera.capacidadAutoregulacion = c.at_xpath("capacidadAutoregulacion").content
          carrera.condicionOperacion =  c.at_xpath("condicionOperacion").content
          carrera.perfilIngresoResultado = c.at_xpath("perfilIngresoResultado").content
          carrera.sede_id = sede.id

          carrera.save
        end
      end
    end

    flash[:notice] = "Archivo importado exitosamente"
  end


  render 'index'

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