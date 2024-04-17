class ApiController < ActionController::Base
    protect_from_forgery with: :null_session

    before_action :prevent_access
    
    private
    
    def prevent_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(token: token)
      end
    end
end