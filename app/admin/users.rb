ActiveAdmin.register User do
  index do
		column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
	end
	form do |f|
		f.inputs "Admin Details" do
			f.input :email
			f.input :name
			f.input :line_1, :label => "alamat 1"
			f.input :line_2, :label => "alamat 2"
			f.input :line_3, :label => "alamat 3"
			f.input :telephone
			f.input :mobile
			f.input :role, :as => :select, :collection => ["tenant","none"]
			f.input :password
			f.input :password_confirmation		
		end	
		f.buttons
	end
end
