class CampaignsController < ApplicationController
  skip_before_action :authenticate!, only: [:index, :show]



  def index 
    @campaigns = Campaign.all
  end 

  def create
    @campaign = Campaign.create(campaign_params)
    redirect_to @campaign
  end

  def show
    @campaign = Campaign.find(params[:id])

  end

  def edit 
      @campaign = Campaign.find(params[:id])
      if @campaign.receiver_id == current_user.id 
      else
          redirect_to @campaign, notice: "You do not have permission to edit this campaign."
      end 

  end 

  def update
    @campaign = Campaign.find(params[:id])
    @campaign.update(campaign_params)
    redirect_to @campaign
  end


  def campaign_params
    params.require(:campaign).permit(:title, :description, :photo_url, :deadline, :total, :receiver_id)
  end



end



