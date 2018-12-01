defmodule MediumGraphqlApiWeb.Resolvers.Comment do
  def create(_, %{input: input}, %{context: %{current_user: user}}) do
    input
    |> Map.merge(%{user_id: user.id})
    |> MediumGraphqlApi.Blog.create_comment()
  end
end
