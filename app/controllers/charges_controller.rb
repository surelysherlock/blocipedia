class ChargesController < ApplicationController

  class Amount
    def self.default
      15_00
    end
  end

  def create
    # Creates a Stripe Customer object, for associating
    # with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )
  
    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: Amount.default,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd'
    )
    current_user.premium!
    flash[:notice] = "Congrats #{current_user.email} you are now a Premium Member!!"
    redirect_to wikis_path # or wherever
  
    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership",
      amount: Amount.default
    }
  end

  def edit
    @charge = Stripe::Charge.list.data[0].id
    current_user.standard!
    flash[:alert] = "We are sorry to see you go"
    redirect_to wikis_path
  end

  def update
    current_user.standard!
    flash[:alert] = "We are sorry to see you go"
    redirect_to wikis_path
  end
end
