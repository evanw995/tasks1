defmodule Tasks1Web.TaskController do
  use Tasks1Web, :controller

  alias Tasks1.Work
  alias Tasks1.Work.Task

  def index(conn, _params) do
    tasks = Work.list_tasks()
    current_user = conn.assigns[:current_user]
    users = Tasks1.Accounts.list_users()
    manages = if current_user do 
        Tasks1.Work.manages_map_for(current_user.id)
    else
      nil
    end
    render(conn, "index.html", tasks: tasks, manages: manages)
  end

  def new(conn, _params) do
    changeset = Work.change_task(%Task{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"task" => task_params}) do
    case Work.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: task_path(conn, :show, task))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Work.get_task!(id)
    timeblocks = Work.list_timeblocks()
    current_user = conn.assigns[:current_user]
    manages = if current_user do 
        Tasks1.Work.manages_map_for(current_user.id)
    else
      nil
    end
    render(conn, "show.html", task: task, timeblocks: timeblocks, manages: manages)
  end

  def edit(conn, %{"id" => id}) do
    task = Work.get_task!(id)
    timeblocks = Work.list_timeblocks()
    changeset = Work.change_task(task)
    render(conn, "edit.html", task: task, changeset: changeset, timeblocks: timeblocks)
  end

  def track(conn, %{"id" => id}) do
    task = Work.get_task!(id)
    changeset = Work.change_task(task)
    render(conn, "track.html", task: task, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Work.get_task!(id)

    case Work.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: task_path(conn, :show, task))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Work.get_task!(id)
    {:ok, _task} = Work.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: task_path(conn, :index))
  end
end
