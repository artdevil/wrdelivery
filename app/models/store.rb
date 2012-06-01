class Store < ActiveRecord::Base
	belongs_to :user
	belongs_to :university
attr_accessible :address, :avatarstore, :description, :latitude, :longnitude, :name, :time_end, :time_now, :university, :user_id, :work_end, :work_now
validates :address, :avatarstore, :description, :name, :time_end, :time_now, :university, :user_id, :work_end, :work_now, :presence => :true
end