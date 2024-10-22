defmodule Sismed2Web.ConsultaControllerTest do
  use Sismed2Web.ConnCase

  import Sismed2.SisMedFixtures

  @create_attrs %{data: ~N[2024-10-21 01:47:00]}
  @update_attrs %{data: ~N[2024-10-22 01:47:00]}
  @invalid_attrs %{data: nil}

  describe "index" do
    test "lists all consultas", %{conn: conn} do
      conn = get(conn, ~p"/consultas")
      assert html_response(conn, 200) =~ "Listing Consultas"
    end
  end

  describe "new consulta" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/consultas/new")
      assert html_response(conn, 200) =~ "New Consulta"
    end
  end

  describe "create consulta" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/consultas", consulta: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/consultas/#{id}"

      conn = get(conn, ~p"/consultas/#{id}")
      assert html_response(conn, 200) =~ "Consulta #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/consultas", consulta: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Consulta"
    end
  end

  describe "edit consulta" do
    setup [:create_consulta]

    test "renders form for editing chosen consulta", %{conn: conn, consulta: consulta} do
      conn = get(conn, ~p"/consultas/#{consulta}/edit")
      assert html_response(conn, 200) =~ "Edit Consulta"
    end
  end

  describe "update consulta" do
    setup [:create_consulta]

    test "redirects when data is valid", %{conn: conn, consulta: consulta} do
      conn = put(conn, ~p"/consultas/#{consulta}", consulta: @update_attrs)
      assert redirected_to(conn) == ~p"/consultas/#{consulta}"

      conn = get(conn, ~p"/consultas/#{consulta}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, consulta: consulta} do
      conn = put(conn, ~p"/consultas/#{consulta}", consulta: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Consulta"
    end
  end

  describe "delete consulta" do
    setup [:create_consulta]

    test "deletes chosen consulta", %{conn: conn, consulta: consulta} do
      conn = delete(conn, ~p"/consultas/#{consulta}")
      assert redirected_to(conn) == ~p"/consultas"

      assert_error_sent 404, fn ->
        get(conn, ~p"/consultas/#{consulta}")
      end
    end
  end

  defp create_consulta(_) do
    consulta = consulta_fixture()
    %{consulta: consulta}
  end
end
