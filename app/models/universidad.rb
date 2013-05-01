class Universidad < ActiveRecord::Base


  has_many :sedes
  has_many :carreras, :through => :sedes

end
