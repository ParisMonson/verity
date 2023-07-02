defmodule Verity.Repo.Migrations.CreateSamples do
  use Ecto.Migration

  def change do
    create table(:samples) do
      add :input, :text

      timestamps()
    end
  end
end
