defmodule DarfeyWeb.Quote do
  defstruct [:author, :quote]
end

defmodule DarfeyWeb.CubeElem do
  defstruct [:id, :location, :model, :state]
end

defmodule DarfeyWeb.Controllers.Helpers do
  require Logger

  def get_quotes() do
    query = """
       select author, quote
       from quotes
    """

    res = Ecto.Adapters.SQL.query!(Darfey.Repo, query)
    cols = Enum.map res.columns, &(String.to_atom(&1))
    Enum.map res.rows, fn(row) ->
      struct(DarfeyWeb.Quote, Enum.zip(cols, row))
    end
  end

  # Get random quote
  def get_random_quote() do
    # Hard coded N, TODO fix
    # Need to get a count of the rows from DB and use that instead
    n = 3
    r = :rand.uniform(n) - 1

    query = """
       select author, quote
       from quotes
       where id = $1
    """

    Logger.debug("r = " <> to_string(r))
    res = Ecto.Adapters.SQL.query!(Darfey.Repo, query, [r])
    cols = Enum.map res.columns, &(String.to_atom(&1))
    Enum.map res.rows, fn(row) ->
      struct(DarfeyWeb.Quote, Enum.zip(cols, row))
    end
  end

end

