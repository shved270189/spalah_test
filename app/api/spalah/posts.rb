module Spalah
  class Posts < Grape::API
    helpers Spalah::Helpers::AuthHelper

    # before { authenticate! }

    namespace :my_post do
      desc 'Posts list', entity: PostEntity, is_array: true
      params do
        use :authentication
        optional 'q[title_cont]', type: String, desc: 'Search by title'
      end
      get do
        posts = Post.search(params[:q]).result
        present posts, with: PostEntity
      end

      desc 'Post', entity: PostEntity
      params do
        use :authentication
        requires :id, type: Integer, desc: 'Post ID'
      end
      get ':id' do
        post = Post.find(params[:id])
        present post, with: PostEntity
      end

      desc 'Create Post', entity: PostEntity
      params do
        use :authentication
        requires :post, type: Hash do
          requires :title, type: String, desc: 'Post Title'
          requires :body, type: String, desc: 'Post Text'
        end
      end
      put 'create_post' do
        post = current_user.posts.create(params[:post])
        present post, with: PostEntity
      end
    end
  end
end
