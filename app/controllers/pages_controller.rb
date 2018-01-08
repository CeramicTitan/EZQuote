class PagesController < ApplicationController
  def index
    set_new_homepage
  end
  
  private
  def set_new_homepage
    if logged_in?
      redirect_to projects_path
    end
  end
end