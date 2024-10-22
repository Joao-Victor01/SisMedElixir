defmodule Sismed2Web.PacienteController do
  use Sismed2Web, :controller

  alias Sismed2.SisMed
  alias Sismed2.SisMed.Paciente

  def index(conn, _params) do
    pacientes = SisMed.list_pacientes()
    render(conn, :index, pacientes: pacientes)
  end

  def new(conn, _params) do
    changeset = SisMed.change_paciente(%Paciente{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"paciente" => paciente_params}) do
    case SisMed.create_paciente(paciente_params) do
      {:ok, paciente} ->
        conn
        |> put_flash(:info, "Paciente created successfully.")
        |> redirect(to: ~p"/pacientes/#{paciente}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    paciente = SisMed.get_paciente!(id)
    render(conn, :show, paciente: paciente)
  end

  def edit(conn, %{"id" => id}) do
    paciente = SisMed.get_paciente!(id)
    changeset = SisMed.change_paciente(paciente)
    render(conn, :edit, paciente: paciente, changeset: changeset)
  end

  def update(conn, %{"id" => id, "paciente" => paciente_params}) do
    paciente = SisMed.get_paciente!(id)

    case SisMed.update_paciente(paciente, paciente_params) do
      {:ok, paciente} ->
        conn
        |> put_flash(:info, "Paciente updated successfully.")
        |> redirect(to: ~p"/pacientes/#{paciente}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, paciente: paciente, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    paciente = SisMed.get_paciente!(id)
    {:ok, _paciente} = SisMed.delete_paciente(paciente)

    conn
    |> put_flash(:info, "Paciente deleted successfully.")
    |> redirect(to: ~p"/pacientes")
  end
end
