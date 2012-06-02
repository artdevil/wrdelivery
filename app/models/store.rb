class Store < ActiveRecord::Base
	belongs_to :user
	belongs_to :university
attr_accessible :address, :avatarstore, :description, :latitude, :longnitude, :name, :time_end, :time_now, :university_id, :user_id, :work_end, :work_now,:delivery_number
validates :delivery_number,:address, :avatarstore, :name, :time_end, :time_now, :work_end, :work_now, :presence => :true
mount_uploader :avatarstore, AvatarstoreUploader

end
