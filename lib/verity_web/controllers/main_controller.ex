defmodule VerityWeb.MainController do
  use VerityWeb, :controller

  alias Verity.VerityWeb
  alias Verity.VerityWeb.Main

  def index(conn, _params) do
    render(conn, :index, layout: false)
  end

  def new(conn, _params) do
    changeset = VerityWeb.change_main(%Main{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"main" => main_params}) do
    case VerityWeb.create_main(main_params) do
      {:ok, main} ->
        conn
        |> put_flash(:info, "Main created successfully.")
        |> redirect(to: ~p"/samples/#{main}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    main = VerityWeb.get_main!(id)
    render(conn, :show, main: main)
  end

  def edit(conn, %{"id" => id}) do
    main = VerityWeb.get_main!(id)
    changeset = VerityWeb.change_main(main)
    render(conn, :edit, main: main, changeset: changeset)
  end

  def update(conn, %{"id" => id, "main" => main_params}) do
    main = VerityWeb.get_main!(id)

    case VerityWeb.update_main(main, main_params) do
      {:ok, main} ->
        conn
        |> put_flash(:info, "Main updated successfully.")
        |> redirect(to: ~p"/samples/#{main}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, main: main, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    main = VerityWeb.get_main!(id)
    {:ok, _main} = VerityWeb.delete_main(main)

    conn
    |> put_flash(:info, "Main deleted successfully.")
    |> redirect(to: ~p"/samples")
  end
end
