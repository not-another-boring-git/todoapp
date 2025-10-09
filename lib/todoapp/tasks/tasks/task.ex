defmodule Todoapp.Tasks.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :name, :string
    field :completed_at, :naive_datetime
    field :tasklist_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :completed_at])
    |> validate_required([:name, :completed_at])
  end
end
