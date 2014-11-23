class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#
  # We created this in order to use inside the parents and 
  #+children classes which are subs of this class.

  protect_from_forgery with: :exception

  def find_parent
    # if the parnt_ids column is not empty?
  	if params[:parent_id].blank?
      #+ find the parent by :id
  		@parent = Parent.find(params[:id])
  	else
      #+ else, try to find parent by the foreign "a key 
      #+ that ceates the relation between the two tables...etc"
      ## primary key "ID" for parents table is the forign key parent_id
  		@parent = Parent.find(params[:parent_id])
  	end
  end
end
