defmodule Sismed2.Repo.Migrations.CreateMedicos do
  use Ecto.Migration

  def change do
    create table(:medicos) do
      add :nome, :string
      add :crm, :string
      add :especializacoes, :string

      timestamps(type: :utc_datetime)
    end
  end
end
