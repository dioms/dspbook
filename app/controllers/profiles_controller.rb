class ProfilesController < ApplicationController

  def index
    @user = User.find(:all, :order => "updated_at desc")
  end

  def show
    @user = User.find(params[:id])
  end

end
