defmodule Tasks1Web.SessionController do
  use Tasks1Web, :controller

  alias Tasks1.Accounts
  alias Tasks1.Accounts.User

  def create(conn, %{"Username" => name, "user_id" => id}) do
    
    if (String.trim(id) == "") do
      conn
      |> put_flash(:error, "Field cannot be empty")
      |> redirect(to: page_path(conn, :index))
    end

    user = if String.trim(id) == "" do
            nil
        else
            Accounts.get_user(id)
        end

    if user.name != name do
      conn
      |> put_flash(:error, "Name does not match ID")
      |> redirect(to: page_path(conn, :index))
    end
    if user do
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Welcome back #{user.name}")
      |> redirect(to: page_path(conn, :feed))
    else
      conn
      |> put_flash(:error, "Invalid user / id combination. Check to make sure the user exists.")
      |> redirect(to: page_path(conn, :index))
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "Logged out")
    |> redirect(to: page_path(conn, :index))
  end
end