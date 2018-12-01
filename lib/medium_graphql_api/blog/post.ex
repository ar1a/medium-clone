defmodule MediumGraphqlApi.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field(:title, :string)
    field(:content, :string)
    field(:published, :boolean, default: false)
    belongs_to(:user, MediumGraphqlApi.Accounts.User)

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :published, :user_id])
    |> validate_required([:title, :content, :published, :user_id])
  end
end