defmodule MediumGraphqlApiWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias MediumGraphqlApiWeb.Schema.Types

  import_types(Types.User)
  import_types(Types.Post)
end
