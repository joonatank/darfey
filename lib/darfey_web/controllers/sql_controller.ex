defmodule DarfeyWeb.SqlController do
  use DarfeyWeb, :controller
  require Logger

  def index(conn, _params) do
    render conn, "index.html"
  end

end
