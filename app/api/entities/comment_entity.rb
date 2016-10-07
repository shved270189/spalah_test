class CommentEntity < Grape::Entity
  expose :id, documentation: { type: 'integer', values: [1] }
  expose :text, documentation: { type: 'string', values: ['Hello!'] }
  expose :user_name, documentation: { type: 'string', values: ['Nick'] }
end
