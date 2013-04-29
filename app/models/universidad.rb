class Universidad < ActiveRecord::Base
  attr_accessible :nombre

  has_many :sedes
  has_many :carreras, :through => :sedes

end
