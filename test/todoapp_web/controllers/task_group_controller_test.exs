defmodule TodoappWeb.TaskGroupControllerTest do
  use TodoappWeb.ConnCase

  import Todoapp.TasksFixtures
  alias Todoapp.Tasks.TaskGroup

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
    test "lists all task_groups", %{conn: conn} do
      conn = get(conn, ~p"/api/task_groups")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create task_group" do
    test "renders task_group when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/task_groups", task_group: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/task_groups/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/task_groups", task_group: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update task_group" do
    setup [:create_task_group]

    test "renders task_group when data is valid", %{conn: conn, task_group: %TaskGroup{id: id} = task_group} do
      conn = put(conn, ~p"/api/task_groups/#{task_group}", task_group: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/task_groups/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, task_group: task_group} do
      conn = put(conn, ~p"/api/task_groups/#{task_group}", task_group: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete task_group" do
    setup [:create_task_group]

    test "deletes chosen task_group", %{conn: conn, task_group: task_group} do
      conn = delete(conn, ~p"/api/task_groups/#{task_group}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/task_groups/#{task_group}")
      end
    end
  end

  defp create_task_group(_) do
    task_group = task_group_fixture()

    %{task_group: task_group}
  end
end
