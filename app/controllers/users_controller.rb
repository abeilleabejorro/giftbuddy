class UsersController < ApplicationController
  skip_before_action :authenticate!, only: [:show]


  def show
    @user = User.find(params[:id])
  end

  def setup
    @user = current_user
    ##need to only show current user's pending campaigns
  end

  def oauth_callback
    options = {
        :site => 'https://connect.stripe.com',
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/token'
      }
    client = OAuth2::Client.new(ENV['CLIENT_ID'], ENV['SECRET_KEY'], options)
    code = params[:code]

    # Make a request to the access_token_uri endpoint t   o get an access_token
    @resp = client.auth_code.get_token(code, :params => {:scope => 'read_write'})
    @access_token = @resp.token


    #save the token in the database
    #redirect to set-up page

    # Use the access_token as you would a regular live-mode API key
    # TODO: Stripe logic

  end


end
