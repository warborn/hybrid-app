class Mutations::User::Logout < GraphQL::Schema::Mutation
  null true
  description "Logout for users"
  payload_type Boolean
  
  def resolve
    if context[:current_user] and context[:token]
      token = context[:token].split(" ")[1]
      Warden::JWTAuth::TokenRevoker.new.call(token)
      true
    else
      false
    end
  end
end
