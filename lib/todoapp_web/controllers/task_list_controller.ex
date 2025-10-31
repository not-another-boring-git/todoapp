defmodule TodoappWeb.TaskListController do
  use TodoappWeb, :controller

  alias Todoapp.Tasks
  alias Todoapp.Tasks.Tasks.TaskList

  action_fallback TodoappWeb.FallbackController

  def index(conn, _params) do
    tasklists = Tasks.list_tasklists()
    render(conn, :index, tasklists: tasklists)
  end

  def create(conn, %{"task_list" => task_list_params}) do
    with {:ok, %TaskList{} = task_list} <- Tasks.create_task_list(task_list_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/tasklists/#{task_list}")
      |> render(:show, task_list: task_list)
    end
  end

  def show(conn, %{"id" => id}) do
    task_list = Tasks.get_task_list!(id)
    render(conn, :show, task_list: task_list)
  end

  def update(conn, %{"id" => id, "task_list" => task_list_params}) do
    task_list = Tasks.get_task_list!(id)

    with {:ok, %TaskList{} = task_list} <- Tasks.update_task_list(task_list, task_list_params) do
      render(conn, :show, task_list: task_list)
    end
  end

  def delete(conn, %{"id" => id}) do
    task_list = Tasks.get_task_list!(id)

    with {:ok, %TaskList{}} <- Tasks.delete_task_list(task_list) do
      send_resp(conn, :no_content, "")
    end
  end
end
