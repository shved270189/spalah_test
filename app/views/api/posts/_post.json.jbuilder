json.extract! post, :id, :title, :body # , :created_at, :updated_at

json.created_at post.created_at.to_i
json.updated_at post.updated_at.to_i

json.comments post.comments, partial: 'comments/comment', as: :comment
json.user post.user, partial: 'users/user', as: :user
