defmodule Sismed2Web.MedicoHTML do
  use Sismed2Web, :html

  embed_templates "medico_html/*"

  @doc """
  Renders a medico form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def medico_form(assigns)
end
