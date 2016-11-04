json.extract! post, :id, :title, :body, :created_at, :updated_at

json.comments post.comments, partial: 'comments/comment', as: :comment
json.user post.user, partial: 'users/user', as: :user
