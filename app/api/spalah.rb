module Spalah
  class Api < Grape::API
    version 'v1'
    format :json
    prefix :spalah

    resources :posts do
      get do
        posts = Post.all
        present posts, with: PostEntity
      end
    end
  end
end
