class ChargesController < ApplicationController


  def new
    @amount = 500

    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.username}",
      amount: @amount
    }
  end

  def create
    @amount = 500

    # Creates a Stripe customer object for associating with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
    customer: customer.id,
    amount: @amount,
    description: "Blocipedia Premium Membership - #{current_user.email}",
    currency: 'usd'
    )

    flash[:notice] = "Enjoy your premium Blocipedia membership, #{current_user.email}!"
    current_user.premium!
    redirect_to user_path(current_user) #or wherever

    #Stripe will send back CardErrors, with friendly messages when something goes wrong.
    # This 'rescue block' catches and displays those errors.
  rescue Stripe::CardError => e
    flash.now[:alert] = e.message
    redirect_to new_charge_path
  end

  def destroy
    flash[:notice] = "Please try our Premium services again in the future, #{current_user.email}!"
    current_user.standard!
    redirect_to current_user
  end
end
