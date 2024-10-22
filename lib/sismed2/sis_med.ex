defmodule Sismed2.SisMed do
  @moduledoc """
  The SisMed context.
  """

  import Ecto.Query, warn: false
  alias Sismed2.Repo

  alias Sismed2.SisMed.Paciente

  @doc """
  Returns the list of pacientes.

  ## Examples

      iex> list_pacientes()
      [%Paciente{}, ...]

  """
  def list_pacientes do
    Repo.all(Paciente)
  end

  @doc """
  Gets a single paciente.

  Raises `Ecto.NoResultsError` if the Paciente does not exist.

  ## Examples

      iex> get_paciente!(123)
      %Paciente{}

      iex> get_paciente!(456)
      ** (Ecto.NoResultsError)

  """
  def get_paciente!(id), do: Repo.get!(Paciente, id)

  @doc """
  Creates a paciente.

  ## Examples

      iex> create_paciente(%{field: value})
      {:ok, %Paciente{}}

      iex> create_paciente(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_paciente(attrs \\ %{}) do
    %Paciente{}
    |> Paciente.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a paciente.

  ## Examples

      iex> update_paciente(paciente, %{field: new_value})
      {:ok, %Paciente{}}

      iex> update_paciente(paciente, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_paciente(%Paciente{} = paciente, attrs) do
    paciente
    |> Paciente.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a paciente.

  ## Examples

      iex> delete_paciente(paciente)
      {:ok, %Paciente{}}

      iex> delete_paciente(paciente)
      {:error, %Ecto.Changeset{}}

  """
  def delete_paciente(%Paciente{} = paciente) do
    Repo.delete(paciente)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking paciente changes.

  ## Examples

      iex> change_paciente(paciente)
      %Ecto.Changeset{data: %Paciente{}}

  """
  def change_paciente(%Paciente{} = paciente, attrs \\ %{}) do
    Paciente.changeset(paciente, attrs)
  end

  alias Sismed2.SisMed.Medico

  @doc """
  Returns the list of medicos.

  ## Examples

      iex> list_medicos()
      [%Medico{}, ...]

  """
  def list_medicos do
    Repo.all(Medico)
  end

  @doc """
  Gets a single medico.

  Raises `Ecto.NoResultsError` if the Medico does not exist.

  ## Examples

      iex> get_medico!(123)
      %Medico{}

      iex> get_medico!(456)
      ** (Ecto.NoResultsError)

  """
  def get_medico!(id), do: Repo.get!(Medico, id)

  @doc """
  Creates a medico.

  ## Examples

      iex> create_medico(%{field: value})
      {:ok, %Medico{}}

      iex> create_medico(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_medico(attrs \\ %{}) do
    %Medico{}
    |> Medico.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a medico.

  ## Examples

      iex> update_medico(medico, %{field: new_value})
      {:ok, %Medico{}}

      iex> update_medico(medico, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_medico(%Medico{} = medico, attrs) do
    medico
    |> Medico.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a medico.

  ## Examples

      iex> delete_medico(medico)
      {:ok, %Medico{}}

      iex> delete_medico(medico)
      {:error, %Ecto.Changeset{}}

  """
  def delete_medico(%Medico{} = medico) do
    Repo.delete(medico)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking medico changes.

  ## Examples

      iex> change_medico(medico)
      %Ecto.Changeset{data: %Medico{}}

  """
  def change_medico(%Medico{} = medico, attrs \\ %{}) do
    Medico.changeset(medico, attrs)
  end

  alias Sismed2.SisMed.Consulta

  @doc """
  Returns the list of consultas.

  ## Examples

      iex> list_consultas()
      [%Consulta{}, ...]

  """
  def list_consultas do
    Repo.all(Consulta)
  end


  @doc """
  Gets a single consulta.

  Raises `Ecto.NoResultsError` if the Consulta does not exist.

  ## Examples

      iex> get_consulta!(123)
      %Consulta{}

      iex> get_consulta!(456)
      ** (Ecto.NoResultsError)

  """
  def get_consulta!(id), do: Repo.get!(Consulta, id)

  @doc """
  Creates a consulta.

  ## Examples

      iex> create_consulta(%{field: value})
      {:ok, %Consulta{}}

      iex> create_consulta(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_consulta(attrs \\ %{}) do
    %Consulta{}
    |> Consulta.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a consulta.

  ## Examples

      iex> update_consulta(consulta, %{field: new_value})
      {:ok, %Consulta{}}

      iex> update_consulta(consulta, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_consulta(%Consulta{} = consulta, attrs) do
    consulta
    |> Consulta.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a consulta.

  ## Examples

      iex> delete_consulta(consulta)
      {:ok, %Consulta{}}

      iex> delete_consulta(consulta)
      {:error, %Ecto.Changeset{}}

  """
  def delete_consulta(%Consulta{} = consulta) do
    Repo.delete(consulta)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking consulta changes.

  ## Examples

      iex> change_consulta(consulta)
      %Ecto.Changeset{data: %Consulta{}}

  """
  def change_consulta(%Consulta{} = consulta, attrs \\ %{}) do
    Consulta.changeset(consulta, attrs)
  end
end
