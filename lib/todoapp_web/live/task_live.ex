

defmodule TodoappWeb.TaskLive do
  use TodoappWeb, :live_view

  alias Todoapp.Tasks

  @impl true
  def mount(_params, _session, socket) do
    tasklists = Tasks.list_tasklists()
    {:ok, assign(socket, tasklists: tasklists, tasks: [], selected_tasklist: nil)}
  end

  @impl true
  def handle_event("select_tasklist", %{"id" => id}, socket) do
    tasklist = Tasks.get_task_list!(id)
    tasks = Tasks.list_tasks() |> Enum.filter(&(&1.tasklist_id == tasklist.id))
    {:noreply, assign(socket, tasks: tasks, selected_tasklist: tasklist)}
  end

  def render(assigns) do
    ~H"""
    <div class="flex">
      <!-- Sidebar -->
      <div class="w-1/4 bg-gray-100 p-4">
        <h2 class="text-lg font-bold mb-4">Task Lists</h2>
        <ul>
          <li :for={tasklist <- @tasklists} class="mb-2">
            <button
              class={[
                "w-full text-left px-4 py-2 rounded",
                @selected_tasklist && @selected_tasklist.id == tasklist.id && "bg-blue-500 text-white",
                @selected_tasklist && @selected_tasklist.id != tasklist.id && "bg-gray-200"
              ]}
              phx-click="select_tasklist"
              phx-value-id={tasklist.id}
            >
              {tasklist.name}
            </button>
          </li>
        </ul>
      </div>

      <!-- Main Content -->
      <div class="w-3/4 p-4">
        <h2 class="text-lg font-bold mb-4">
          <%= if @selected_tasklist do %>
            Tasks for <%= @selected_tasklist.name %>
          <% else %>
            Select a Task List
          <% end %>
        </h2>

        <ul>
          <li :for={task <- @tasks} class="mb-2">
            <div class="flex items-center justify-between bg-gray-200 px-4 py-2 rounded">
              <span>{task.name}</span>
              <span class="text-sm text-gray-500">
                <%= if task.completed_at do %>
                  Completed
                <% else %>
                  Pending
                <% end %>
              </span>
            </div>
          </li>
        </ul>
      </div>
    </div>
    """
  end
end
