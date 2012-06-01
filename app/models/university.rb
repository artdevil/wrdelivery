class University < ActiveRecord::Base
	has_many :store
  attr_accessible :description, :name
end
