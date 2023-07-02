defmodule Verity.VerityWeb.Main do
  use Ecto.Schema
  import Ecto.Changeset

  schema "samples" do
    field :input, :string

    timestamps()
  end

  @doc false
  def changeset(main, attrs) do
    main
    |> cast(attrs, [:input])
    |> validate_required([:input])
  end
end
