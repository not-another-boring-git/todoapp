defmodule TodoappWeb.TaskListJSON do
  alias Todoapp.Tasks.Tasks.TaskList

  @doc """
  Renders a list of tasklists.
  """
  def index(%{tasklists: tasklists}) do
    %{data: for(task_list <- tasklists, do: data(task_list))}
  end

  @doc """
  Renders a single task_list.
  """
  def show(%{task_list: task_list}) do
    %{data: data(task_list)}
  end

  defp data(%TaskList{} = task_list) do
    %{
      id: task_list.id,
      name: task_list.name,
      tasks: for(task <- Map.get(task_list, :tasks, []), do: %{id: task.id, name: task.name})
    }
  end
end
