defmodule MediumGraphqlApiWeb.Schema do
  use Absinthe.Schema

  alias MediumGraphqlApiWeb.Resolvers
  alias MediumGraphqlApiWeb.Schema.Middleware

  # import types
  import_types(MediumGraphqlApiWeb.Schema.Types)

  query do
    @desc "Get a list of all users"
    field :users, list_of(:user) do
      middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.User.users/3)
    end
  end

  mutation do
    @desc "Register a new user"
    field :register_user, type: :user do
      arg(:input, non_null(:user_input))
      resolve(&Resolvers.User.register/3)
    end

    @desc "Login"
    field :login, type: :session do
      arg(:input, non_null(:session_input))
      resolve(&Resolvers.User.login/3)
    end

    @desc "Create a post"
    field :create_post, type: :post do
      arg(:input, non_null(:post_input))
      middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.Post.create/3)
    end

    @desc "Create a comment"
    field :create_comment, type: :comment do
      arg(:input, non_null(:comment_input))
      middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.Comment.create/3)
    end
  end
end
