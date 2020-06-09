class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def home
    @books = policy_scope(Book).sample(8)
  end

  def top
    @books = policy_scope(Book).sample(8)
  end

end
