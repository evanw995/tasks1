defmodule Tasks1.Work.Manage do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks1.Work.Manage


  schema "manages" do
    belongs_to :manager, User
    belongs_to :managee, User

    timestamps()
  end

  @doc false
  def changeset(%Manage{} = manage, attrs) do
    manage
    |> cast(attrs, [:manager_id, :managee_id])
    |> validate_required([:manager_id, :managee_id])
  end
end
