class Sede < ActiveRecord::Base
  belongs_to :universidad
  attr_accessible :ciudad, :nombre, :universidad_id
  has_many :carreras

end
