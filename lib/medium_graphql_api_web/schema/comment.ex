defmodule MediumGraphqlApiWeb.Schema.Types.Comment do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: MediumGraphqlApi.Repo

  object :comment do
    field(:id, :id)
    field(:content, :string)
    field(:post, :post, resolve: assoc(:post))
    field(:user, :user, resolve: assoc(:user))
  end

  input_object :comment_input do
    field(:post_id, non_null(:id))
    field(:content, non_null(:string))
  end
end
