defmodule Sismed2.SisMedTest do
  use Sismed2.DataCase

  alias Sismed2.SisMed

  describe "pacientes" do
    alias Sismed2.SisMed.Paciente

    import Sismed2.SisMedFixtures

    @invalid_attrs %{nome: nil, cpf: nil, contato: nil}

    test "list_pacientes/0 returns all pacientes" do
      paciente = paciente_fixture()
      assert SisMed.list_pacientes() == [paciente]
    end

    test "get_paciente!/1 returns the paciente with given id" do
      paciente = paciente_fixture()
      assert SisMed.get_paciente!(paciente.id) == paciente
    end

    test "create_paciente/1 with valid data creates a paciente" do
      valid_attrs = %{nome: "some nome", cpf: "some cpf", contato: "some contato"}

      assert {:ok, %Paciente{} = paciente} = SisMed.create_paciente(valid_attrs)
      assert paciente.nome == "some nome"
      assert paciente.cpf == "some cpf"
      assert paciente.contato == "some contato"
    end

    test "create_paciente/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SisMed.create_paciente(@invalid_attrs)
    end

    test "update_paciente/2 with valid data updates the paciente" do
      paciente = paciente_fixture()
      update_attrs = %{nome: "some updated nome", cpf: "some updated cpf", contato: "some updated contato"}

      assert {:ok, %Paciente{} = paciente} = SisMed.update_paciente(paciente, update_attrs)
      assert paciente.nome == "some updated nome"
      assert paciente.cpf == "some updated cpf"
      assert paciente.contato == "some updated contato"
    end

    test "update_paciente/2 with invalid data returns error changeset" do
      paciente = paciente_fixture()
      assert {:error, %Ecto.Changeset{}} = SisMed.update_paciente(paciente, @invalid_attrs)
      assert paciente == SisMed.get_paciente!(paciente.id)
    end

    test "delete_paciente/1 deletes the paciente" do
      paciente = paciente_fixture()
      assert {:ok, %Paciente{}} = SisMed.delete_paciente(paciente)
      assert_raise Ecto.NoResultsError, fn -> SisMed.get_paciente!(paciente.id) end
    end

    test "change_paciente/1 returns a paciente changeset" do
      paciente = paciente_fixture()
      assert %Ecto.Changeset{} = SisMed.change_paciente(paciente)
    end
  end

  describe "medicos" do
    alias Sismed2.SisMed.Medico

    import Sismed2.SisMedFixtures

    @invalid_attrs %{nome: nil, crm: nil, especializacoes: nil}

    test "list_medicos/0 returns all medicos" do
      medico = medico_fixture()
      assert SisMed.list_medicos() == [medico]
    end

    test "get_medico!/1 returns the medico with given id" do
      medico = medico_fixture()
      assert SisMed.get_medico!(medico.id) == medico
    end

    test "create_medico/1 with valid data creates a medico" do
      valid_attrs = %{nome: "some nome", crm: "some crm", especializacoes: "some especializacoes"}

      assert {:ok, %Medico{} = medico} = SisMed.create_medico(valid_attrs)
      assert medico.nome == "some nome"
      assert medico.crm == "some crm"
      assert medico.especializacoes == "some especializacoes"
    end

    test "create_medico/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SisMed.create_medico(@invalid_attrs)
    end

    test "update_medico/2 with valid data updates the medico" do
      medico = medico_fixture()
      update_attrs = %{nome: "some updated nome", crm: "some updated crm", especializacoes: "some updated especializacoes"}

      assert {:ok, %Medico{} = medico} = SisMed.update_medico(medico, update_attrs)
      assert medico.nome == "some updated nome"
      assert medico.crm == "some updated crm"
      assert medico.especializacoes == "some updated especializacoes"
    end

    test "update_medico/2 with invalid data returns error changeset" do
      medico = medico_fixture()
      assert {:error, %Ecto.Changeset{}} = SisMed.update_medico(medico, @invalid_attrs)
      assert medico == SisMed.get_medico!(medico.id)
    end

    test "delete_medico/1 deletes the medico" do
      medico = medico_fixture()
      assert {:ok, %Medico{}} = SisMed.delete_medico(medico)
      assert_raise Ecto.NoResultsError, fn -> SisMed.get_medico!(medico.id) end
    end

    test "change_medico/1 returns a medico changeset" do
      medico = medico_fixture()
      assert %Ecto.Changeset{} = SisMed.change_medico(medico)
    end
  end

  describe "consultas" do
    alias Sismed2.SisMed.Consulta

    import Sismed2.SisMedFixtures

    @invalid_attrs %{data: nil}

    test "list_consultas/0 returns all consultas" do
      consulta = consulta_fixture()
      assert SisMed.list_consultas() == [consulta]
    end

    test "get_consulta!/1 returns the consulta with given id" do
      consulta = consulta_fixture()
      assert SisMed.get_consulta!(consulta.id) == consulta
    end

    test "create_consulta/1 with valid data creates a consulta" do
      valid_attrs = %{data: ~N[2024-10-21 01:47:00]}

      assert {:ok, %Consulta{} = consulta} = SisMed.create_consulta(valid_attrs)
      assert consulta.data == ~N[2024-10-21 01:47:00]
    end

    test "create_consulta/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SisMed.create_consulta(@invalid_attrs)
    end

    test "update_consulta/2 with valid data updates the consulta" do
      consulta = consulta_fixture()
      update_attrs = %{data: ~N[2024-10-22 01:47:00]}

      assert {:ok, %Consulta{} = consulta} = SisMed.update_consulta(consulta, update_attrs)
      assert consulta.data == ~N[2024-10-22 01:47:00]
    end

    test "update_consulta/2 with invalid data returns error changeset" do
      consulta = consulta_fixture()
      assert {:error, %Ecto.Changeset{}} = SisMed.update_consulta(consulta, @invalid_attrs)
      assert consulta == SisMed.get_consulta!(consulta.id)
    end

    test "delete_consulta/1 deletes the consulta" do
      consulta = consulta_fixture()
      assert {:ok, %Consulta{}} = SisMed.delete_consulta(consulta)
      assert_raise Ecto.NoResultsError, fn -> SisMed.get_consulta!(consulta.id) end
    end

    test "change_consulta/1 returns a consulta changeset" do
      consulta = consulta_fixture()
      assert %Ecto.Changeset{} = SisMed.change_consulta(consulta)
    end
  end
end
