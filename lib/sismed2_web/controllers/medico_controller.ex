defmodule Sismed2Web.MedicoController do
  use Sismed2Web, :controller

  alias Sismed2.SisMed
  alias Sismed2.SisMed.Medico

  def index(conn, _params) do
    medicos = SisMed.list_medicos()
    render(conn, :index, medicos: medicos)
  end

  def new(conn, _params) do
    changeset = SisMed.change_medico(%Medico{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"medico" => medico_params}) do
    case SisMed.create_medico(medico_params) do
      {:ok, medico} ->
        conn
        |> put_flash(:info, "Medico created successfully.")
        |> redirect(to: ~p"/medicos/#{medico}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    medico = SisMed.get_medico!(id)
    render(conn, :show, medico: medico)
  end

  def edit(conn, %{"id" => id}) do
    medico = SisMed.get_medico!(id)
    changeset = SisMed.change_medico(medico)
    render(conn, :edit, medico: medico, changeset: changeset)
  end

  def update(conn, %{"id" => id, "medico" => medico_params}) do
    medico = SisMed.get_medico!(id)

    case SisMed.update_medico(medico, medico_params) do
      {:ok, medico} ->
        conn
        |> put_flash(:info, "Medico updated successfully.")
        |> redirect(to: ~p"/medicos/#{medico}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, medico: medico, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    medico = SisMed.get_medico!(id)
    {:ok, _medico} = SisMed.delete_medico(medico)

    conn
    |> put_flash(:info, "Medico deleted successfully.")
    |> redirect(to: ~p"/medicos")
  end
end
