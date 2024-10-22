defmodule Sismed2Web.ConsultaHTML do
  use Sismed2Web, :html

  embed_templates "consulta_html/*"

  @doc """
  Renders a consulta form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def consulta_form(assigns)
end
