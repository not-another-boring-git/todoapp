defmodule TodoappWeb.TaskLiveTest do
  use TodoappWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  alias Todoapp.Tasks

  setup do
    # Create some sample data for testing
    {:ok, tasklist} = Tasks.create_task_list(%{name: "Sample TaskList"})
    {:ok, _task} = Tasks.create_task(%{name: "Sample Task", tasklist_id: tasklist.id})

    %{tasklist: tasklist}
  end

  test "renders the TaskLive page", %{conn: conn, tasklist: tasklist} do
    # Navigate to the TaskLive page
    {:ok, view, html} = live(conn, "/tasks")

    # Assert that the page renders correctly
    assert html =~ "Task Lists"
    assert html =~ tasklist.name

    # Simulate clicking on a task list
    view
    |> element("button[phx-value-id=\"#{tasklist.id}\"]")
    |> render_click()

    # Assert that tasks for the selected task list are displayed
    assert render(view) =~ "Tasks for #{tasklist.name}"
    assert render(view) =~ "Sample Task"
  end
end
