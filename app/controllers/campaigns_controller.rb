class CampaignsController < ApplicationController
  def index 
    @campaigns = Campaign.all
  end 

  def create
    @campaign = Campaign.create(campaign_params)
    binding.pry
    redirect_to '/campaigns'
  end


  def campaign_params
    params.require(:campaign).permit(:description, :photo_url, :deadline, :total, :receiver_id)
  end
end

