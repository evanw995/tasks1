defmodule Tasks1.Work.Timeblock do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks1.Work.Timeblock


  schema "timeblocks" do
    field :end, :naive_datetime
    field :start, :naive_datetime
    belongs_to :task, Tasks1.Work.Task

    timestamps()
  end

  @doc false
  def changeset(%Timeblock{} = timeblock, attrs) do
    timeblock
    |> cast(attrs, [:start, :end, :task_id])
    |> validate_required([:start, :end, :task_id])
    |> validate_number(:task_id, greater_than: 0)
  end
end
