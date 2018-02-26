defmodule DarfeyWeb.Post do
  import Ecto.Changeset # This is the one that includes cast
  #use DarfeyWeb, :model
  use Ecto.Schema

  schema "posts" do
    field :title, :string
    field :body, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body])
    |> validate_required([:title, :body])
  end
end
