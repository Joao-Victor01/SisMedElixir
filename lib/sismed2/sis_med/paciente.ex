defmodule Sismed2.SisMed.Paciente do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pacientes" do
    field :nome, :string
    field :cpf, :string
    field :contato, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(paciente, attrs) do
    paciente
    |> cast(attrs, [:nome, :cpf, :contato])
    |> validate_required([:nome, :cpf, :contato])
  end
end
