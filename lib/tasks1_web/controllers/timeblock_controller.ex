defmodule Tasks1Web.TimeblockController do
  use Tasks1Web, :controller

  alias Tasks1.Work
  alias Tasks1.Work.Timeblock

  def index(conn, _params) do
    timeblocks = Work.list_timeblocks()
    render(conn, "index.html", timeblocks: timeblocks)
  end

  def new(conn, _params) do
    changeset = Work.change_timeblock(%Timeblock{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"timeblock" => timeblock_params}) do
    case Work.create_timeblock(timeblock_params) do
      {:ok, timeblock} ->
        conn
        |> put_flash(:info, "Timeblock created successfully.")
        |> redirect(to: timeblock_path(conn, :show, timeblock))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    timeblock = Work.get_timeblock!(id)
    render(conn, "show.html", timeblock: timeblock)
  end

  def edit(conn, %{"id" => id}) do
    timeblock = Work.get_timeblock!(id)
    changeset = Work.change_timeblock(timeblock)
    render(conn, "edit.html", timeblock: timeblock, changeset: changeset)
  end

  def update(conn, %{"id" => id, "timeblock" => timeblock_params}) do
    timeblock = Work.get_timeblock!(id)

    case Work.update_timeblock(timeblock, timeblock_params) do
      {:ok, timeblock} ->
        conn
        |> put_flash(:info, "Timeblock updated successfully.")
        |> redirect(to: timeblock_path(conn, :show, timeblock))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", timeblock: timeblock, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    timeblock = Work.get_timeblock!(id)
    {:ok, _timeblock} = Work.delete_timeblock(timeblock)

    conn
    |> put_flash(:info, "Timeblock deleted successfully.")
    |> redirect(to: timeblock_path(conn, :index))
  end
end
