class Api::V1::UserTokenController < Knock::AuthTokenController
    skip_before_action :verify_authenticity_token
#   sample request
#   curl -v --data "auth[email]=test@example.com&auth[password]=password" http://localhost:3000/api/v1/user_token
  
    def entity_name
    'User'
  end
end
