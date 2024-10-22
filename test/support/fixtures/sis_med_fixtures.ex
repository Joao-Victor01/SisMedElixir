defmodule Sismed2.SisMedFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sismed2.SisMed` context.
  """

  @doc """
  Generate a paciente.
  """
  def paciente_fixture(attrs \\ %{}) do
    {:ok, paciente} =
      attrs
      |> Enum.into(%{
        contato: "some contato",
        cpf: "some cpf",
        nome: "some nome"
      })
      |> Sismed2.SisMed.create_paciente()

    paciente
  end

  @doc """
  Generate a medico.
  """
  def medico_fixture(attrs \\ %{}) do
    {:ok, medico} =
      attrs
      |> Enum.into(%{
        crm: "some crm",
        especializacoes: "some especializacoes",
        nome: "some nome"
      })
      |> Sismed2.SisMed.create_medico()

    medico
  end

  @doc """
  Generate a consulta.
  """
  def consulta_fixture(attrs \\ %{}) do
    {:ok, consulta} =
      attrs
      |> Enum.into(%{
        data: ~N[2024-10-21 01:47:00]
      })
      |> Sismed2.SisMed.create_consulta()

    consulta
  end
end
