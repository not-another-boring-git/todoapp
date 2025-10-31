defmodule TodoappWeb.TaskGroupJSON do
  alias Todoapp.Tasks.TaskGroup

  @doc """
  Renders a list of task_groups.
  """
  def index(%{task_groups: task_groups}) do
    %{data: for(task_group <- task_groups, do: data(task_group))}
  end

  @doc """
  Renders a single task_group.
  """
  def show(%{task_group: task_group}) do
    %{data: data(task_group)}
  end

  defp data(%TaskGroup{} = task_group) do
    %{
      id: task_group.id,
      name: task_group.name
    }
  end
end
