defmodule Sismed2Web.PacienteControllerTest do
  use Sismed2Web.ConnCase

  import Sismed2.SisMedFixtures

  @create_attrs %{nome: "some nome", cpf: "some cpf", contato: "some contato"}
  @update_attrs %{nome: "some updated nome", cpf: "some updated cpf", contato: "some updated contato"}
  @invalid_attrs %{nome: nil, cpf: nil, contato: nil}

  describe "index" do
    test "lists all pacientes", %{conn: conn} do
      conn = get(conn, ~p"/pacientes")
      assert html_response(conn, 200) =~ "Listing Pacientes"
    end
  end

  describe "new paciente" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/pacientes/new")
      assert html_response(conn, 200) =~ "New Paciente"
    end
  end

  describe "create paciente" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/pacientes", paciente: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/pacientes/#{id}"

      conn = get(conn, ~p"/pacientes/#{id}")
      assert html_response(conn, 200) =~ "Paciente #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/pacientes", paciente: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Paciente"
    end
  end

  describe "edit paciente" do
    setup [:create_paciente]

    test "renders form for editing chosen paciente", %{conn: conn, paciente: paciente} do
      conn = get(conn, ~p"/pacientes/#{paciente}/edit")
      assert html_response(conn, 200) =~ "Edit Paciente"
    end
  end

  describe "update paciente" do
    setup [:create_paciente]

    test "redirects when data is valid", %{conn: conn, paciente: paciente} do
      conn = put(conn, ~p"/pacientes/#{paciente}", paciente: @update_attrs)
      assert redirected_to(conn) == ~p"/pacientes/#{paciente}"

      conn = get(conn, ~p"/pacientes/#{paciente}")
      assert html_response(conn, 200) =~ "some updated nome"
    end

    test "renders errors when data is invalid", %{conn: conn, paciente: paciente} do
      conn = put(conn, ~p"/pacientes/#{paciente}", paciente: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Paciente"
    end
  end

  describe "delete paciente" do
    setup [:create_paciente]

    test "deletes chosen paciente", %{conn: conn, paciente: paciente} do
      conn = delete(conn, ~p"/pacientes/#{paciente}")
      assert redirected_to(conn) == ~p"/pacientes"

      assert_error_sent 404, fn ->
        get(conn, ~p"/pacientes/#{paciente}")
      end
    end
  end

  defp create_paciente(_) do
    paciente = paciente_fixture()
    %{paciente: paciente}
  end
end
