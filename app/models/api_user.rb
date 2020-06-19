class ApiUser < User
  self.table_name = 'users'

  devise :recoverable, :validatable,
         :lockable, :timeoutable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
end