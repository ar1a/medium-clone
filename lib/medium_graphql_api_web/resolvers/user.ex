defmodule MediumGraphqlApiWeb.Resolvers.User do
  def users(_, _, _) do
    {:ok, MediumGraphqlApi.Accounts.list_users()}
  end

  # TODO: Return JWT
  def register(_, %{input: input}, _) do
    MediumGraphqlApi.Accounts.create_user(input)
  end
end
