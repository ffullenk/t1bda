class Carrera < ActiveRecord::Base



  belongs_to :sede
  attr_accessible :cantidadAniosAcreditada, :capacidadAutoregulacion, :codigo, :condicionOperacion, :nombre, :perfilIngresoResultado, :sede_id

  has_one :universidad, :through => :sede

  validates_presence_of :sede
  validates :nombre, :presence => true, :length => { :minimum => 5 }
  validates :cantidadAniosAcreditada, :presence => true, :numericality => { :only_integer => true }
  validates :cantidadAniosAcreditada, :inclusion => { :in => 0..7, :message => "Debe estar entre 0-7" }
  validates :capacidadAutoregulacion, :presence => true, :numericality => { :only_integer => true }
  validates :capacidadAutoregulacion, :inclusion => { :in => 1..5, :message => "Debe estar entre 1-5" }
  validates :codigo, :presence => true, :numericality => { :only_integer => true }
  validates :codigo, :inclusion => { :in => 0..1000, :message => "Debe estar entre 0-1000" }
  validates :condicionOperacion, :presence => true, :numericality => { :only_integer => true }
  validates :condicionOperacion, :inclusion => { :in => 1..5, :message => "Debe estar entre 1-5" }
  validates :perfilIngresoResultado, :numericality => { :only_integer => true }
  validates :perfilIngresoResultado, :inclusion => { :in => 1..5, :message => "Debe estar entre 1-5" }




  def self.search(search)
  if search
    find(:all, :conditions => ['nombre LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

end
