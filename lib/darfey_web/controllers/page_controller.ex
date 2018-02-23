defmodule DarfeyWeb.PageController do
  use DarfeyWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

   def hello(conn, _params) do
      render conn, "hello.html"
   end

   def blog(conn, _params) do
      render conn, "blog.html"
   end

   def contact(conn, _params) do
      render conn, "contact.html"
   end
end
