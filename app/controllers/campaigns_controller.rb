class CampaignsController < ApplicationController
  def index 
    @campaigns = Campaign.all
  end 

  def create
    @campaign = Campaign.create(campaign_params)
    redirect_to '/campaigns'
  end

  def show
    @campaign = Campaign.find(params[:id])
    
  end

  def campaign_params
    params.require(:campaign).permit(:description, :photo_url, :deadline, :total, :receiver_id)
  end
end

