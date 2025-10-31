defmodule TodoappWeb.TaskListControllerTest do
  use TodoappWeb.ConnCase

  import Todoapp.TasksFixtures
  alias Todoapp.Tasks.Tasks.TaskList

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tasklists", %{conn: conn} do
      conn = get(conn, ~p"/api/tasklists")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create task_list" do
    test "renders task_list when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/tasklists", task_list: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/tasklists/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/tasklists", task_list: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update task_list" do
    setup [:create_task_list]

    test "renders task_list when data is valid", %{conn: conn, task_list: %TaskList{id: id} = task_list} do
      conn = put(conn, ~p"/api/tasklists/#{task_list}", task_list: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/tasklists/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, task_list: task_list} do
      conn = put(conn, ~p"/api/tasklists/#{task_list}", task_list: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete task_list" do
    setup [:create_task_list]

    test "deletes chosen task_list", %{conn: conn, task_list: task_list} do
      conn = delete(conn, ~p"/api/tasklists/#{task_list}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/tasklists/#{task_list}")
      end
    end
  end

  defp create_task_list(_) do
    task_list = task_list_fixture()

    %{task_list: task_list}
  end
end
