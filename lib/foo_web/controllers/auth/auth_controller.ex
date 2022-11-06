defmodule FooWeb.AuthController do
  use FooWeb, :controller

  defp index(conn, _params) do
    render(conn, "index.html")
  end
end
