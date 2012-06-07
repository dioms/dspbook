class ProfilesController < ApplicationController

  before_filter :authenticate

  def index
    @user = User.find(:all, :order => "name asc")
  end

  def show
    @user = User.find(params[:id])
  end

  protected

  def authenticate
    if user_signed_in?
      return true
    else
      authenticate_or_request_with_http_basic do |username, password|
        username == "disc" && password == "DISC2012"
      end
    end
  end


end
