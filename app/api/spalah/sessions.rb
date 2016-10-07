module Spalah
  class Sessions < Grape::API
    helpers Spalah::Helpers::AuthHelper

    resources :sign do
      desc 'Create session token', entity: SessionEntity
      params do
        requires :email, type: String
        requires :provider, type: String
        requires :provider_id, type: Integer
      end
      post 'in' do
        user = User.find_by(email: params[:email], provider: params[:provider], provider_id: params[:provider_id])
        present({ auth_token: user.generate_session_token! }, with: SessionEntity)
      end

      desc 'Delete session', entity: SessionEntity
      params do
        use :authentication
      end
      delete 'out' do
        authenticate!
        current_session.destroy
        { success: true }
      end
    end
  end
end
