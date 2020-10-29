module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false

    # users方法返回UserType类型的一组对象。
    def users
      User.all
    end

    # user方法接收一个类型为ID的:id的参数，返回一个UserType对象，（ID是一个内置的类型）
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end
  end
end
