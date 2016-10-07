# dcf630073e3619440b855826a71f944b
module Spalah
  module AuthHelper
    extend Grape::API::Helpers

    params :authentication do
      requires :auth_token, type: String, desc: 'Auth Token'
    end
  end
end
