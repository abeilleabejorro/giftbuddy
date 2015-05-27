class UsersController < ApplicationController
  skip_before_action :authenticate!, only: [:show]


  def show
    @user = User.find(params[:id])
  end

  def setup
    binding.pry
    if params[:code]

    end
    @user = current_user
    ##need to only show current user's pending campaigns
  end

  def oauth_callback
  end


end
