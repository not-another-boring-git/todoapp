defmodule Todoapp.Tasks.Tasks.TaskList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasklists" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task_list, attrs) do
    task_list
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
