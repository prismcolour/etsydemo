module OrdersHelper
  def charge_card
    Stripe.api_key = ENV['STRIPE_API_KEY']
    token = params[:stripeToken]

    begin
        charge = Stripe::Charge.create(
          amount:   (@listing.price * 100).floor,
          currency: 'usd',
          card:     token
        )
        flash[:notice] = 'Thanks for ordering!'
      rescue Stripe::CardError => e
        flash[:danger] = e.message
      end

    transfer = Stripe::Transfer.create(
      amount:      (@listing.price * 95).floor,
      currency:    'usd',
      destination: @seller.recipient
    )
  end
end
