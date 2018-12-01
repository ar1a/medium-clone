defmodule MediumGraphqlApiWeb.Schema do
  use Absinthe.Schema

  alias MediumGraphqlApiWeb.Resolvers

  # import types
  import_types(MediumGraphqlApiWeb.Schema.Types)

  query do
    @desc "Get a list of all users"
    field :users, list_of(:user) do
      resolve(&Resolvers.User.users/3)
    end
  end

  mutation do
    @desc "Register a new user"
    field :register_user, type: :user do
      arg(:input, non_null(:user_input))
      resolve(&Resolvers.User.register/3)
    end
  end
end
