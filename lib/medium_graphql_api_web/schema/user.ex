defmodule MediumGraphqlApiWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  object :user do
    field(:id, :id)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)
    field(:role, :string)
  end

  input_object :user_input do
    field(:first_name, non_null(:string))
    field(:last_name, non_null(:string))
    field(:email, non_null(:string))
    field(:password, non_null(:string))
  end

  object :session do
    field(:token, :string)
    field(:user, :user)
  end

  input_object :session_input do
    field(:email, non_null(:string))
    field(:password, non_null(:string))
  end
end
