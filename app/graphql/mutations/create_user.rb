class Mutations::CreateUser < Mutations::BaseMutation
  argument :name, String, required: true
  argument :email, String, required: true

  # 和上面查询字段概念相同，接收参数创建对象，同时希望返回一个user带有我们的新模型的字段，并附带一个errors数组。
  field :user, Types::UserType, null: false
  field :errors, [String], null: false


  def resolve(name:, email:)
    user = User.new(name: name, email: email)
    if user.save
      {
        user: user,
        errors: []
      }
    else
      {
        user: nil,
        errors: user.errors.full_message
      }
    end
  end

end
