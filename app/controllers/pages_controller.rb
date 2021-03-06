class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def home
    @books_cat1 = policy_scope(Book).where(category: "Fiction").limit(4)
    @books_cat2 = policy_scope(Book).where(category: "Social Science").limit(4)
    @books_cat3 = policy_scope(Book).where(category: "Literary Collections").limit(4)
  end

  def top
    @books = policy_scope(Book).order(rating: :desc).limit(8)
    @books = @books.where.not(rating: nil)
  end

end
