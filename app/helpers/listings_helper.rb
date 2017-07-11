module ListingsHelper
  def transfer
    if current_user.recipient.blank?
        Stripe.api_key = ENV['STRIPE_API_KEY']
        token = params[:stripeToken]

        recipient = Stripe::Account.create(
          type:    'custom',
          country: 'US',
          email:   current_user.email
        )

        current_user.recipient = recipient.id
        current_user.save
    end
  end
end
