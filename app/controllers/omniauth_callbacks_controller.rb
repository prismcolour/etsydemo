class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include OmniauthHelper

  stripe_connect
end
