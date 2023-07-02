defmodule Verity.VerityWebTest do
  use Verity.DataCase

  alias Verity.VerityWeb

  describe "samples" do
    alias Verity.VerityWeb.Main

    import Verity.VerityWebFixtures

    @invalid_attrs %{input: nil}

    test "list_samples/0 returns all samples" do
      main = main_fixture()
      assert VerityWeb.list_samples() == [main]
    end

    test "get_main!/1 returns the main with given id" do
      main = main_fixture()
      assert VerityWeb.get_main!(main.id) == main
    end

    test "create_main/1 with valid data creates a main" do
      valid_attrs = %{input: "some input"}

      assert {:ok, %Main{} = main} = VerityWeb.create_main(valid_attrs)
      assert main.input == "some input"
    end

    test "create_main/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = VerityWeb.create_main(@invalid_attrs)
    end

    test "update_main/2 with valid data updates the main" do
      main = main_fixture()
      update_attrs = %{input: "some updated input"}

      assert {:ok, %Main{} = main} = VerityWeb.update_main(main, update_attrs)
      assert main.input == "some updated input"
    end

    test "update_main/2 with invalid data returns error changeset" do
      main = main_fixture()
      assert {:error, %Ecto.Changeset{}} = VerityWeb.update_main(main, @invalid_attrs)
      assert main == VerityWeb.get_main!(main.id)
    end

    test "delete_main/1 deletes the main" do
      main = main_fixture()
      assert {:ok, %Main{}} = VerityWeb.delete_main(main)
      assert_raise Ecto.NoResultsError, fn -> VerityWeb.get_main!(main.id) end
    end

    test "change_main/1 returns a main changeset" do
      main = main_fixture()
      assert %Ecto.Changeset{} = VerityWeb.change_main(main)
    end
  end
end
