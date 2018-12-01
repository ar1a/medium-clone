defmodule MediumGraphqlApiWeb.Resolvers.User do
  def users(_, _, %{context: context}) do
    {:ok, MediumGraphqlApi.Accounts.list_users()}
  end

  # TODO: Return JWT
  def register(_, %{input: input}, _) do
    MediumGraphqlApi.Accounts.create_user(input)
  end

  def login(_, %{input: input}, _) do
    with {:ok, user} <- MediumGraphqlApi.Accounts.Session.authenticate(input),
         {:ok, token, _} <- MediumGraphqlApi.Guardian.encode_and_sign(user) do
      {:ok, %{token: token, user: user}}
    end
  end
end
