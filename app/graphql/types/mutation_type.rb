module Types
  class MutationType < Types::BaseObject
    field :login, mutation: Mutations::User::Login
  end
end
