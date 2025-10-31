defmodule TodoappWeb.TaskGroupController do
  use TodoappWeb, :controller

  alias Todoapp.Tasks
  alias Todoapp.Tasks.TaskGroup

  action_fallback TodoappWeb.FallbackController

  def index(conn, _params) do
    task_groups = Tasks.list_task_groups()
    render(conn, :index, task_groups: task_groups)
  end

  def create(conn, %{"task_group" => task_group_params}) do
    with {:ok, %TaskGroup{} = task_group} <- Tasks.create_task_group(task_group_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/task_groups/#{task_group}")
      |> render(:show, task_group: task_group)
    end
  end

  def show(conn, %{"id" => id}) do
    task_group = Tasks.get_task_group!(id)
    render(conn, :show, task_group: task_group)
  end

  def update(conn, %{"id" => id, "task_group" => task_group_params}) do
    task_group = Tasks.get_task_group!(id)

    with {:ok, %TaskGroup{} = task_group} <- Tasks.update_task_group(task_group, task_group_params) do
      render(conn, :show, task_group: task_group)
    end
  end

  def delete(conn, %{"id" => id}) do
    task_group = Tasks.get_task_group!(id)

    with {:ok, %TaskGroup{}} <- Tasks.delete_task_group(task_group) do
      send_resp(conn, :no_content, "")
    end
  end
end
