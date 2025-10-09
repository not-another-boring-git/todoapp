defmodule Mix.Tasks.Todoapp.Seed do
  use Mix.Task

  @shortdoc "Seeds the database with example tasks and task lists"

  def run(_) do
    Mix.Task.run("app.start")

    alias Todoapp.Repo
    alias Todoapp.Tasks

    IO.puts("Seeding the database...")

    # Create example task lists
    {:ok, personal_list} = Tasks.create_task_list(%{name: "Personal"})
    {:ok, work_list} = Tasks.create_task_list(%{name: "Work"})
    {:ok, shopping_list} = Tasks.create_task_list(%{name: "Shopping"})

    # Add tasks to the Personal list
    Tasks.create_task(%{name: "Go for a run", tasklist_id: personal_list.id})
    Tasks.create_task(%{name: "Read a book", tasklist_id: personal_list.id})

    # Add tasks to the Work list
    Tasks.create_task(%{name: "Finish project report", tasklist_id: work_list.id})
    Tasks.create_task(%{name: "Prepare for meeting", tasklist_id: work_list.id})

    # Add tasks to the Shopping list
    Tasks.create_task(%{name: "Buy groceries", tasklist_id: shopping_list.id})
    Tasks.create_task(%{name: "Order new headphones", tasklist_id: shopping_list.id})

    IO.puts("Database seeded successfully!")
  end
end
