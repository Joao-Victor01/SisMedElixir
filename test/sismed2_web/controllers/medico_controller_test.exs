defmodule Sismed2Web.MedicoControllerTest do
  use Sismed2Web.ConnCase

  import Sismed2.SisMedFixtures

  @create_attrs %{nome: "some nome", crm: "some crm", especializacoes: "some especializacoes"}
  @update_attrs %{nome: "some updated nome", crm: "some updated crm", especializacoes: "some updated especializacoes"}
  @invalid_attrs %{nome: nil, crm: nil, especializacoes: nil}

  describe "index" do
    test "lists all medicos", %{conn: conn} do
      conn = get(conn, ~p"/medicos")
      assert html_response(conn, 200) =~ "Listing Medicos"
    end
  end

  describe "new medico" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/medicos/new")
      assert html_response(conn, 200) =~ "New Medico"
    end
  end

  describe "create medico" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/medicos", medico: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/medicos/#{id}"

      conn = get(conn, ~p"/medicos/#{id}")
      assert html_response(conn, 200) =~ "Medico #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/medicos", medico: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Medico"
    end
  end

  describe "edit medico" do
    setup [:create_medico]

    test "renders form for editing chosen medico", %{conn: conn, medico: medico} do
      conn = get(conn, ~p"/medicos/#{medico}/edit")
      assert html_response(conn, 200) =~ "Edit Medico"
    end
  end

  describe "update medico" do
    setup [:create_medico]

    test "redirects when data is valid", %{conn: conn, medico: medico} do
      conn = put(conn, ~p"/medicos/#{medico}", medico: @update_attrs)
      assert redirected_to(conn) == ~p"/medicos/#{medico}"

      conn = get(conn, ~p"/medicos/#{medico}")
      assert html_response(conn, 200) =~ "some updated nome"
    end

    test "renders errors when data is invalid", %{conn: conn, medico: medico} do
      conn = put(conn, ~p"/medicos/#{medico}", medico: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Medico"
    end
  end

  describe "delete medico" do
    setup [:create_medico]

    test "deletes chosen medico", %{conn: conn, medico: medico} do
      conn = delete(conn, ~p"/medicos/#{medico}")
      assert redirected_to(conn) == ~p"/medicos"

      assert_error_sent 404, fn ->
        get(conn, ~p"/medicos/#{medico}")
      end
    end
  end

  defp create_medico(_) do
    medico = medico_fixture()
    %{medico: medico}
  end
end
