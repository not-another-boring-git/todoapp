defmodule Todoapp.Tasks.Tasks.TaskList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasklists" do
    field :name, :string
    has_many :tasks, Todoapp.Tasks.Tasks.Task, foreign_key: :tasklist_id
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task_list, attrs) do
    task_list
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
