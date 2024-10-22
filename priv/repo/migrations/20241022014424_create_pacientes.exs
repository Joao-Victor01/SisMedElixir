defmodule Sismed2.Repo.Migrations.CreatePacientes do
  use Ecto.Migration

  def change do
    create table(:pacientes) do
      add :nome, :string
      add :cpf, :string
      add :contato, :string

      timestamps(type: :utc_datetime)
    end
  end
end
