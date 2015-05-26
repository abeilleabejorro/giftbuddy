class PledgesController < ApplicationController


  def create
    @pledge = Pledge.create(pledge_params)
    redirect_to "/campaigns/#{@pledge.campaign_id}"
  end

  def pledge_params
    params.require(:pledge).permit(:amount, :giver_id, :campaign_id)
  end

end
