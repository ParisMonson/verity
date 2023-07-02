defmodule VerityWeb.MainControllerTest do
  use VerityWeb.ConnCase

  import Verity.VerityWebFixtures

  @create_attrs %{input: "some input"}
  @update_attrs %{input: "some updated input"}
  @invalid_attrs %{input: nil}

  describe "index" do
    test "lists all samples", %{conn: conn} do
      conn = get(conn, ~p"/samples")
      assert html_response(conn, 200) =~ "Listing Samples"
    end
  end

  describe "new main" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/samples/new")
      assert html_response(conn, 200) =~ "New Main"
    end
  end

  describe "create main" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/samples", main: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/samples/#{id}"

      conn = get(conn, ~p"/samples/#{id}")
      assert html_response(conn, 200) =~ "Main #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/samples", main: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Main"
    end
  end

  describe "edit main" do
    setup [:create_main]

    test "renders form for editing chosen main", %{conn: conn, main: main} do
      conn = get(conn, ~p"/samples/#{main}/edit")
      assert html_response(conn, 200) =~ "Edit Main"
    end
  end

  describe "update main" do
    setup [:create_main]

    test "redirects when data is valid", %{conn: conn, main: main} do
      conn = put(conn, ~p"/samples/#{main}", main: @update_attrs)
      assert redirected_to(conn) == ~p"/samples/#{main}"

      conn = get(conn, ~p"/samples/#{main}")
      assert html_response(conn, 200) =~ "some updated input"
    end

    test "renders errors when data is invalid", %{conn: conn, main: main} do
      conn = put(conn, ~p"/samples/#{main}", main: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Main"
    end
  end

  describe "delete main" do
    setup [:create_main]

    test "deletes chosen main", %{conn: conn, main: main} do
      conn = delete(conn, ~p"/samples/#{main}")
      assert redirected_to(conn) == ~p"/samples"

      assert_error_sent 404, fn ->
        get(conn, ~p"/samples/#{main}")
      end
    end
  end

  defp create_main(_) do
    main = main_fixture()
    %{main: main}
  end
end
