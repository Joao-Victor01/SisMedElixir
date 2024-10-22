defmodule Sismed2Web.PacienteHTML do
  use Sismed2Web, :html

  embed_templates "paciente_html/*"

  @doc """
  Renders a paciente form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def paciente_form(assigns)
end
