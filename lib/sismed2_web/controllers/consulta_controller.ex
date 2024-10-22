defmodule Sismed2Web.ConsultaController do
  use Sismed2Web, :controller

  alias Sismed2.SisMed
  alias Sismed2.SisMed.Consulta

  def index(conn, _params) do
    consultas = SisMed.list_consultas()
    render(conn, :index, consultas: consultas)
  end

  def new(conn, _params) do
    changeset = SisMed.change_consulta(%Consulta{})
    medicos = SisMed.list_medicos()
    pacientes = SisMed.list_pacientes()
    render(conn, :new, changeset: changeset, medicos: medicos, pacientes: pacientes)
  end

  def create(conn, %{"consulta" => consulta_params}) do
    case SisMed.create_consulta(consulta_params) do
      {:ok, consulta} ->
        conn
        |> put_flash(:info, "Consulta criada com sucesso.")
        |> redirect(to: ~p"/consultas/#{consulta}")

      {:error, %Ecto.Changeset{} = changeset} ->
        medicos = SisMed.list_medicos()
        pacientes = SisMed.list_pacientes()
        render(conn, :new, changeset: changeset, medicos: medicos, pacientes: pacientes)
    end
  end


  def show(conn, %{"id" => id}) do
    consulta = SisMed.get_consulta!(id)
    medico = SisMed.get_medico!(consulta.medico_id)
    paciente = SisMed.get_paciente!(consulta.paciente_id)

    render(conn, :show, consulta: consulta, medico: medico, paciente: paciente)
  end

  def edit(conn, %{"id" => id}) do
    consulta = SisMed.get_consulta!(id)
    changeset = SisMed.change_consulta(consulta)
    medicos = SisMed.list_medicos()
    pacientes = SisMed.list_pacientes()

    render(conn, :edit, consulta: consulta, changeset: changeset, medicos: medicos, pacientes: pacientes)
  end


  def update(conn, %{"id" => id, "consulta" => consulta_params}) do
    consulta = SisMed.get_consulta!(id)

    case SisMed.update_consulta(consulta, consulta_params) do
      {:ok, consulta} ->
        conn
        |> put_flash(:info, "Consulta atualizada com sucesso.")
        |> redirect(to: ~p"/consultas/#{consulta}")

      {:error, %Ecto.Changeset{} = changeset} ->
        medicos = SisMed.list_medicos()
        pacientes = SisMed.list_pacientes()
        render(conn, :edit, consulta: consulta, changeset: changeset, medicos: medicos, pacientes: pacientes)
    end
  end


  def delete(conn, %{"id" => id}) do
    consulta = SisMed.get_consulta!(id)
    {:ok, _consulta} = SisMed.delete_consulta(consulta)

    conn
    |> put_flash(:info, "Consulta deleted successfully.")
    |> redirect(to: ~p"/consultas")
  end
end
