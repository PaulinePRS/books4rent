class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def home
  end

  # def index 
  #   if params[:query] 
  #     @query = params[:query] 
  #     @books = Book.where("name ILIKE '%#{params[:query]}%'") 
  #   else 
  #     @books = Book.order(:name) 
  # end
end
