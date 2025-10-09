defmodule Todoapp.Repo.Migrations.CreateTasklists do
  use Ecto.Migration

  def change do
    create table(:tasklists) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
