class PostEntity < Grape::Entity
  expose :id, documentation: { type: 'integer', values: [1] }
  expose :title, documentation: { type: 'string', values: ['My First Post'] }
  expose :body, documentation: { type: 'string', values: ['Some post text'] }
  expose :user, using: UserEntity, documentation: { type: 'UserEntity', is_array: false }
  expose :comments, using: CommentEntity, documentation: { type: 'CommentEntity', is_array: true }
end
