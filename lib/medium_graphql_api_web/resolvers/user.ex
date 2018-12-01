defmodule MediumGraphqlApiWeb.Resolvers.User do
  def users(_, _, _) do
    {:ok, MediumGraphqlApi.Accounts.list_users()}
  end
end
