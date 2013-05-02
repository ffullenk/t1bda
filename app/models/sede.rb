class Sede < ActiveRecord::Base



  belongs_to :universidad
  attr_accessible :ciudad, :nombre, :universidad_id
  has_many :carreras

  validates_presence_of :universidad
  validates :nombre, :presence => true, :length => { :minimum => 3 }
  validates :ciudad, :presence => true, :length => { :minimum => 3 }

end
