module Types
  class QueryType < Types::BaseObject
    field :me, Types::UserType, null: false,
      description: "The data of the current user"

    def me
      context[:current_user]
    end
  end
end
