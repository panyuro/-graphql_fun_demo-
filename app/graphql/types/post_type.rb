module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: true
    field :title, String, null: true
    field :body, String, null: true
  end
end
