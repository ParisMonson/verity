defmodule Verity.VerityWeb do
  @moduledoc """
  The VerityWeb context.
  """

  import Ecto.Query, warn: false
  alias Verity.Repo

  alias Verity.VerityWeb.Main

  @doc """
  Returns the list of samples.

  ## Examples

      iex> list_samples()
      [%Main{}, ...]

  """
  def list_samples do
    Repo.all(Main)
  end

  @doc """
  Gets a single main.

  Raises `Ecto.NoResultsError` if the Main does not exist.

  ## Examples

      iex> get_main!(123)
      %Main{}

      iex> get_main!(456)
      ** (Ecto.NoResultsError)

  """
  def get_main!(id), do: Repo.get!(Main, id)

  @doc """
  Creates a main.

  ## Examples

      iex> create_main(%{field: value})
      {:ok, %Main{}}

      iex> create_main(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_main(attrs \\ %{}) do
    %Main{}
    |> Main.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a main.

  ## Examples

      iex> update_main(main, %{field: new_value})
      {:ok, %Main{}}

      iex> update_main(main, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_main(%Main{} = main, attrs) do
    main
    |> Main.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a main.

  ## Examples

      iex> delete_main(main)
      {:ok, %Main{}}

      iex> delete_main(main)
      {:error, %Ecto.Changeset{}}

  """
  def delete_main(%Main{} = main) do
    Repo.delete(main)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking main changes.

  ## Examples

      iex> change_main(main)
      %Ecto.Changeset{data: %Main{}}

  """
  def change_main(%Main{} = main, attrs \\ %{}) do
    Main.changeset(main, attrs)
  end
end
