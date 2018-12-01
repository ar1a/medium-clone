defmodule MediumGraphqlApiWeb.Schema.Middleware.Authorize do
  @behaviour Absinthe.Middleware

  def call(resolution, role) do
    with %{current_user: user} <- resolution.context,
         true <- correct_role?(user, role) do
      resolution
    else
      _ -> resolution |> Absinthe.Resolution.put_result({:error, "unauthorized"})
    end
  end

  defp corret_role?(%{}, :any), do: true
  defp corret_role?(%{role: role}, role), do: true
  defp corret_role?(_, _), do: false
end
