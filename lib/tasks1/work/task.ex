defmodule Tasks1.Work.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks1.Work.Task


  schema "tasks" do
    field :completed, :boolean, default: false
    field :description, :string
    field :time, :integer, default: 0
    field :title, :string
    belongs_to :user, Tasks1.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :description, :time, :completed, :user_id])
    |> foreign_key_constraint(:user_id)
    |> validate_required([:title, :description, :time, :completed])
    |> validate_number(:user_id, greater_than: 0)
    |> validate_number(:time, greater_than_or_equal_to: 0)
  end
end
