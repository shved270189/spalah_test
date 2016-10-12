require 'rails_helper'

RSpec.describe Spalah::Sessions do

  describe 'POST /spalah/v1/sign/in' do
    let!(:user) { create(:user, provider: 'facebook', provider_id: 123) }

    let(:post_params) { { email: user.email, provider: user.provider, provider_id: user.provider_id } }
    let(:post_response) { post '/spalah/v1/sign/in', params: post_params }

    it do
      expect { post_response }.to change { Session.count }.from(0).to(1)
    end

    context 'response' do
      let(:post_result) { JSON.parse response.body }
      before { post_response }

      it do
        expect(response.status).to eq 201
      end

      it do
        expect(post_result['auth_token']).to eq Session.first.token
      end
    end


  end

  describe 'DELETE /spalah/v1/sign/out' do
    let!(:current_user) { create(:user) }
    let!(:session) { create(:session, user: current_user) }

    let(:delete_params) { { auth_token: session.token } }
    let(:delete_response) { delete '/spalah/v1/sign/out', params: delete_params }

    it do
      expect { delete_response }.to change { Session.count }.from(1).to(0)
    end
  end
end