class UserEntity < Grape::Entity
  expose :id, documentation: { type: 'integer', values: [1] }
  expose :email, documentation: { type: 'string', values: ['some@example.com'] }
  expose :name, documentation: { type: 'string', values: ['Bob'] }
end
