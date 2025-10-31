defmodule Todoapp.Tasks do
  @moduledoc """
  The Tasks context.
  """

  import Ecto.Query, warn: false
  alias Todoapp.Repo

  alias Todoapp.Tasks.Tasks.TaskList

  @doc """
  Returns the list of tasklists.

  ## Examples

      iex> list_tasklists()
      [%TaskList{}, ...]

  """
  def list_tasklists do
    Repo.all(TaskList)
  end

  @doc """
  Gets a single task_list.

  Raises `Ecto.NoResultsError` if the Task list does not exist.

  ## Examples

      iex> get_task_list!(123)
      %TaskList{}

      iex> get_task_list!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task_list!(id) do
    tasklist = Repo.get!(TaskList, id)
    Map.put(tasklist, :tasks, Repo.preload(tasklist, :tasks).tasks)
  end

  @doc """
  Creates a task_list.

  ## Examples

      iex> create_task_list(%{field: value})
      {:ok, %TaskList{}}

      iex> create_task_list(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task_list(attrs) do
    %TaskList{}
    |> TaskList.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task_list.

  ## Examples

      iex> update_task_list(task_list, %{field: new_value})
      {:ok, %TaskList{}}

      iex> update_task_list(task_list, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task_list(%TaskList{} = task_list, attrs) do
    task_list
    |> TaskList.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a task_list.

  ## Examples

      iex> delete_task_list(task_list)
      {:ok, %TaskList{}}

      iex> delete_task_list(task_list)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task_list(%TaskList{} = task_list) do
    Repo.delete(task_list)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task_list changes.

  ## Examples

      iex> change_task_list(task_list)
      %Ecto.Changeset{data: %TaskList{}}

  """
  def change_task_list(%TaskList{} = task_list, attrs \\ %{}) do
    TaskList.changeset(task_list, attrs)
  end

  alias Todoapp.Tasks.Tasks.Task

  @doc """
  Returns the list of tasks.

  ## Examples

      iex> list_tasks()
      [%Task{}, ...]

  """
  def list_tasks do
    Repo.all(Task)
  end

  @doc """
  Gets a single task.

  Raises `Ecto.NoResultsError` if the Task does not exist.

  ## Examples

      iex> get_task!(123)
      %Task{}

      iex> get_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task!(id), do: Repo.get!(Task, id)

  @doc """
  Creates a task.

  ## Examples

      iex> create_task(%{field: value})
      {:ok, %Task{}}

      iex> create_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task(attrs) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task.

  ## Examples

      iex> update_task(task, %{field: new_value})
      {:ok, %Task{}}

      iex> update_task(task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task(%Task{} = task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a task.

  ## Examples

      iex> delete_task(task)
      {:ok, %Task{}}

      iex> delete_task(task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task(%Task{} = task) do
    Repo.delete(task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task changes.

  ## Examples

      iex> change_task(task)
      %Ecto.Changeset{data: %Task{}}

  """
  def change_task(%Task{} = task, attrs \\ %{}) do
    Task.changeset(task, attrs)
  end

  alias Todoapp.Tasks.TaskGroup

  @doc """
  Returns the list of task_groups.

  ## Examples

      iex> list_task_groups()
      [%TaskGroup{}, ...]

  """
  def list_task_groups do
    Repo.all(TaskGroup)
  end

  @doc """
  Gets a single task_group.

  Raises `Ecto.NoResultsError` if the Task group does not exist.

  ## Examples

      iex> get_task_group!(123)
      %TaskGroup{}

      iex> get_task_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task_group!(id), do: Repo.get!(TaskGroup, id)

  @doc """
  Creates a task_group.

  ## Examples

      iex> create_task_group(%{field: value})
      {:ok, %TaskGroup{}}

      iex> create_task_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task_group(attrs) do
    %TaskGroup{}
    |> TaskGroup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task_group.

  ## Examples

      iex> update_task_group(task_group, %{field: new_value})
      {:ok, %TaskGroup{}}

      iex> update_task_group(task_group, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task_group(%TaskGroup{} = task_group, attrs) do
    task_group
    |> TaskGroup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a task_group.

  ## Examples

      iex> delete_task_group(task_group)
      {:ok, %TaskGroup{}}

      iex> delete_task_group(task_group)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task_group(%TaskGroup{} = task_group) do
    Repo.delete(task_group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task_group changes.

  ## Examples

      iex> change_task_group(task_group)
      %Ecto.Changeset{data: %TaskGroup{}}

  """
  def change_task_group(%TaskGroup{} = task_group, attrs \\ %{}) do
    TaskGroup.changeset(task_group, attrs)
  end
end
