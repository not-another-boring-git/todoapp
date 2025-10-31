defmodule Todoapp.Tasks.TaskGroup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "task_groups" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task_group, attrs) do
    task_group
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
