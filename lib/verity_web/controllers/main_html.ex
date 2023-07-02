defmodule VerityWeb.MainHTML do
  use VerityWeb, :html

  embed_templates "main_html/*"

  @doc """
  Renders a main form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def main_form(assigns)
end
