defmodule Sismed2.SisMed.Medico do
  use Ecto.Schema
  import Ecto.Changeset

  schema "medicos" do
    field :nome, :string
    field :crm, :string
    field :especializacoes, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(medico, attrs) do
    medico
    |> cast(attrs, [:nome, :crm, :especializacoes])
    |> validate_required([:nome, :crm, :especializacoes])
  end
end
