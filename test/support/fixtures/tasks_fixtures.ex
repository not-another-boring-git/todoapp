defmodule Todoapp.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todoapp.Tasks` context.
  """

  @doc """
  Generate a task_list.
  """
  def task_list_fixture(attrs \\ %{}) do
    {:ok, task_list} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Todoapp.Tasks.create_task_list()

    task_list
  end

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        completed_at: ~N[2025-10-08 12:47:00],
        name: "some name"
      })
      |> Todoapp.Tasks.create_task()

    task
  end
end
