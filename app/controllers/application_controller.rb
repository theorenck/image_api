class ApplicationController < ActionController::API
	
	include ActionController::HttpAuthentication::Token::ControllerMethods

	protected

		def authenticate
		  authenticate_token || render_unauthorized
		end

		def authenticate_token
		  authenticate_with_http_token do |token, options|
		  	User.find_by(token: token)
		  end
		end

		def render_unauthorized
		  self.headers['WWW-Authenticate'] = 'Token realm="API"'
		  render json: 'Bad credentials', status: :unauthorized
		end
end
