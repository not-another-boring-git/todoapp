defmodule Todoapp.Repo.Migrations.CreateTaskGroups do
  use Ecto.Migration

  def change do
    create table(:task_groups) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
