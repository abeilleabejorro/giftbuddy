class CampaignsController < ApplicationController
  skip_before_action :authenticate!, only: [:index, :show, :new]


  def index 
    @campaigns = Campaign.all
  end 

  def create
    @campaign = Campaign.create(campaign_params)
    @campaign.status = "Pending"
    if @campaign.photo_url == ""
      @campaign.photo_url = ["/gift-1.jpg",
        "/gift-2.jpg",
        "/gift-3.jpg",
        "/gift-4.jpg"].sample
    end
    @campaign.save
    redirect_to set_up_path
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

  def new 
    if logged_in?
      @campaign = Campaign.new
    else
      redirect_to sign_in_path, notice: "You have to be logged in to do that."
    end

  end 

  def launch
    @campaign = Campaign.find(params[:id])
    if @campaign.receiver.connected_to_stripe?
      @campaign.status = "Live"
      @campaign.save 
      redirect_to @campaign, notice: "Your campaign is live. The money is going to roll in!"
    else
      redirect_to set_up_path, notice: "You have to connect your account to stripe."  
    end 
  end 


  def campaign_params
    params.require(:campaign).permit(:title, :description, :photo_url, :deadline, :total, :receiver_id)
  end



end



