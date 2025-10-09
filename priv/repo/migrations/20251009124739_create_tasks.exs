defmodule Todoapp.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :completed_at, :naive_datetime
      add :tasklist_id, references(:tasklists, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:tasks, [:tasklist_id])
  end
end
