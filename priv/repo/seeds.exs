# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Todoapp.Repo.insert!(%Todoapp.SomeSchema{})

alias Todoapp.Repo
alias Todoapp.Tasks

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
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
