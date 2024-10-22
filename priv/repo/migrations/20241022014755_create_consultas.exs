defmodule Sismed2.Repo.Migrations.CreateConsultas do
  use Ecto.Migration

  def change do
    create table(:consultas) do
      add :data, :naive_datetime
      add :medico_id, references(:medicos, on_delete: :nothing)
      add :paciente_id, references(:pacientes, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:consultas, [:medico_id])
    create index(:consultas, [:paciente_id])
  end
end
