class Universidad < ActiveRecord::Base
  attr_accessible :nombre

  has_many :sedes


end
