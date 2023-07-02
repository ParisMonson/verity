defmodule Verity.VerityWebFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Verity.VerityWeb` context.
  """

  @doc """
  Generate a main.
  """
  def main_fixture(attrs \\ %{}) do
    {:ok, main} =
      attrs
      |> Enum.into(%{
        input: "some input"
      })
      |> Verity.VerityWeb.create_main()

    main
  end
end
