defmodule Sismed2.SisMed.Consulta do
  use Ecto.Schema
  import Ecto.Changeset

  schema "consultas" do
    field :data, :naive_datetime
    field :medico_id, :id
    field :paciente_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(consulta, attrs) do
    consulta
    |> cast(attrs, [:data, :medico_id, :paciente_id])
    |> validate_required([:data, :medico_id, :paciente_id])
  end
end
