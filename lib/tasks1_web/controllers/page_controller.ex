defmodule Tasks1Web.PageController do
  use Tasks1Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def feed(conn, _params) do
    tasks = Tasks1.Work.list_tasks()
    # changeset = Tasks1.Work.change_task(%Tasks1.Work.task{})
    render conn, "taskfeed.html", tasks: tasks #, changeset: changeset
  end
end
