defmodule DarfeyWeb.MediaController do
  use DarfeyWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
