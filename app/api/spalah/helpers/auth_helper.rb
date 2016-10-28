module Spalah
  module Helpers
    module AuthHelper
      extend Grape::API::Helpers

      params :authentication do
        optional :auth_token, type: String, desc: 'Auth Token'
      end
    end
  end
end
