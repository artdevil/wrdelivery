class StoresController < ApplicationController
	load_and_authorize_resource  
	def index
	  @store = Store.all
		respond_to do |format|  
      format.html  
      format.json { render :json => @store }
    end
  end

  def show
		@store = Store.find(params[:id])
		respond_to do |format|  
    format.html  
    format.json { render :json => @store }  
  end  
  end

  def new
		@store = Store.new
  end
	def create
		@store = Store.new(params[:store])
		if @store.save
			@store.update_attributes(:user_id => current_user.id)
			redirect_to root_path
		else
			render 'new'		
		end	
	end

  def edit
	
  end
	
end
