class ApiUser < User
  include Tokenizable

  devise :recoverable, :validatable,
         :lockable, :timeoutable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
end
