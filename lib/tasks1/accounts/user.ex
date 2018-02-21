defmodule Tasks1.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks1.Accounts.User


  schema "users" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
