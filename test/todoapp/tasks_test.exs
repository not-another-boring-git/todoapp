defmodule Todoapp.TasksTest do
  use Todoapp.DataCase

  alias Todoapp.Tasks

  describe "tasklists" do
    alias Todoapp.Tasks.Tasks.TaskList

    import Todoapp.TasksFixtures

    @invalid_attrs %{name: nil}

    test "list_tasklists/0 returns all tasklists" do
      task_list = task_list_fixture()
      assert Tasks.list_tasklists() == [task_list]
    end

    test "get_task_list!/1 returns the task_list with given id" do
      task_list = task_list_fixture()
      assert Tasks.get_task_list!(task_list.id) == task_list
    end

    test "create_task_list/1 with valid data creates a task_list" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %TaskList{} = task_list} = Tasks.create_task_list(valid_attrs)
      assert task_list.name == "some name"
    end

    test "create_task_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task_list(@invalid_attrs)
    end

    test "update_task_list/2 with valid data updates the task_list" do
      task_list = task_list_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %TaskList{} = task_list} = Tasks.update_task_list(task_list, update_attrs)
      assert task_list.name == "some updated name"
    end

    test "update_task_list/2 with invalid data returns error changeset" do
      task_list = task_list_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task_list(task_list, @invalid_attrs)
      assert task_list == Tasks.get_task_list!(task_list.id)
    end

    test "delete_task_list/1 deletes the task_list" do
      task_list = task_list_fixture()
      assert {:ok, %TaskList{}} = Tasks.delete_task_list(task_list)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task_list!(task_list.id) end
    end

    test "change_task_list/1 returns a task_list changeset" do
      task_list = task_list_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task_list(task_list)
    end
  end

  describe "tasks" do
    alias Todoapp.Tasks.Tasks.Task

    import Todoapp.TasksFixtures

    @invalid_attrs %{name: nil, completed_at: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{name: "some name", completed_at: ~N[2025-10-08 12:47:00]}

      assert {:ok, %Task{} = task} = Tasks.create_task(valid_attrs)
      assert task.name == "some name"
      assert task.completed_at == ~N[2025-10-08 12:47:00]
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{name: "some updated name", completed_at: ~N[2025-10-09 12:47:00]}

      assert {:ok, %Task{} = task} = Tasks.update_task(task, update_attrs)
      assert task.name == "some updated name"
      assert task.completed_at == ~N[2025-10-09 12:47:00]
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task(task)
    end
  end

  describe "task_groups" do
    alias Todoapp.Tasks.TaskGroup

    import Todoapp.TasksFixtures

    @invalid_attrs %{name: nil}

    test "list_task_groups/0 returns all task_groups" do
      task_group = task_group_fixture()
      assert Tasks.list_task_groups() == [task_group]
    end

    test "get_task_group!/1 returns the task_group with given id" do
      task_group = task_group_fixture()
      assert Tasks.get_task_group!(task_group.id) == task_group
    end

    test "create_task_group/1 with valid data creates a task_group" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %TaskGroup{} = task_group} = Tasks.create_task_group(valid_attrs)
      assert task_group.name == "some name"
    end

    test "create_task_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task_group(@invalid_attrs)
    end

    test "update_task_group/2 with valid data updates the task_group" do
      task_group = task_group_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %TaskGroup{} = task_group} = Tasks.update_task_group(task_group, update_attrs)
      assert task_group.name == "some updated name"
    end

    test "update_task_group/2 with invalid data returns error changeset" do
      task_group = task_group_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task_group(task_group, @invalid_attrs)
      assert task_group == Tasks.get_task_group!(task_group.id)
    end

    test "delete_task_group/1 deletes the task_group" do
      task_group = task_group_fixture()
      assert {:ok, %TaskGroup{}} = Tasks.delete_task_group(task_group)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task_group!(task_group.id) end
    end

    test "change_task_group/1 returns a task_group changeset" do
      task_group = task_group_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task_group(task_group)
    end
  end
end
