module Types
  class MutationType < Types::BaseObject
    field :logout, mutation: Mutations::User::Logout
    field :login, mutation: Mutations::User::Login
  end
end
