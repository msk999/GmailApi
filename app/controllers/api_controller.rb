class ApiController < ApplicationController
  include Knock::Authenticable
    # skip_before_action :verify_authenticity_token
    before_action :authenticate_user
    before_action :set_default_format
    

   # Method for checking if current_user is admin or not.
   def authorize_as_admin
    return_unauthorized unless !current_user.nil? && current_user.is_admin?
  end
  
    private
  
      def set_default_format
        request.format = :json
      end
  end