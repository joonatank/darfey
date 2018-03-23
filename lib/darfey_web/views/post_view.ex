defmodule DarfeyWeb.PostView do
  use DarfeyWeb, :view

  # Needed for random_quotes
  import DarfeyWeb.Controllers.Helpers

  def markdown(body) do
    body
    |> Earmark.as_html!
    |> raw
  end
end
