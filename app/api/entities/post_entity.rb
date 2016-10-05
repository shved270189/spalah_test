class PostEntity < Grape::Entity
  expose :id, :title, :body
end
