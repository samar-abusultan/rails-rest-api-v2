class Api::V1::UserTokenController < ::Knock::AuthTokenController
  # skip_before_action :verify_authenticity_token

  # name space of class, since we have name space controllers
  def entity_name
    'User'
  end

end
