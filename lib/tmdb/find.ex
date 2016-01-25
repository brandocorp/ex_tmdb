defmodule TMDB.Find do
  import TMDB.API

  @doc """
  Find an object by its `id`.

  The supported external sources for each object are as follows:

  * Movies: `imdb_id`
  * People: `imdb_id`, `freebase_mid`, `freebase_id`, `tvrage_id`
  * TV Series: `imdb_id`, `freebase_mid`, `freebase_id`, `tvdb_id`, `tvrage_id`
  * TV Season: `freebase_mid`, `freebase_id`, `tvdb_id`, `tvrage_id`
  * TV Episode: `imdb_id`, `freebase_mid`, `freebase_id`, `tvdb_id`, `tvrage_id`

  ### Example
      TMDB.Find.find("tt0076759", "imdb_id")
  """
  def find(id, source) do
    case TMDB.get("/find/#{id}", default_headers, options(source)) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
    end
  end

  def options(source) do
    Keyword.new([{
      :params, [
        {"external_source", "#{source}"},
        {"api_key", TMDB.api_key}
      ]
    }])
  end
end
