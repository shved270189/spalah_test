module Spalah
  class Api < Grape::API
    version 'v1'
    format :json
    prefix 'spalah'
    rescue_from :all

    helpers do
      def current_user
        @current_user ||= @current_session&.user
      end

      def current_session
        @current_session ||= Session.where('updated_at > ?', 1.hour.ago)
                                    .find_by(token: params[:auth_token])
      end

      def authenticate!
        return true if current_session && current_user && current_session.touch
        error!({ error: '401 Unauthorized' }, 401)
      end
    end

    mount Spalah::Posts
    mount Spalah::Sessions

    add_swagger_documentation(
      api_version: 'v1',
      hide_documentation_path: true,
      hide_format: true,
      info: {
        title: 'API documentation'
      }
    )
  end
end
