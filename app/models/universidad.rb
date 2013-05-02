class Universidad < ActiveRecord::Base

  attr_accessible :nombre
  has_many :sedes
  has_many :carreras, :through => :sedes

  validates_presence_of :nombre



  def self.search(search)
  if search
    find(:all, :conditions => ['nombre LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end


end
