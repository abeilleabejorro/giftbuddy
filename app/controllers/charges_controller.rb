class ChargesController < ApplicationController

def new
end

def create

  token = params[:stripeToken]
  @campaign = Campaign.find(params["campaign-id"])
  stripe_id = @campaign.receiver.stripe_user_id 

  # Amount in cents
  @amount = params[:amount].to_i*100

  # customer = Stripe::Customer.create(
  #   :email => params[:stripeEmail],
  #   :card  => params[:stripeToken]
  # )

  charge = Stripe::Charge.create({
    :source    => token,
    :amount      => @amount,
    :description => 'Giftbuddy Pledge',
    :currency    => 'usd'},
    :stripe_account => stripe_id)

  flash[:notice] = "Charge of #{@amount/100} was succesful. We think with 80% confidence. Thanks!"
  redirect_to @campaign 

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end

end
