defmodule MediumGraphqlApiWeb.Resolvers.Post do
  def create(_, %{input: input}, %{context: %{current_user: user}}) do
    input
    |> Map.merge(%{user_id: user.id})
    |> MediumGraphqlApi.Blog.create_post()
  end
end
