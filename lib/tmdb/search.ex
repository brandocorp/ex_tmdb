defmodule TMDB.Search do
  import TMDB.API

  def get(type, query) do
    case TMDB.get("/search/#{type}", default_headers, options(query)) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
    end
  end

  def options(query) do
    Keyword.new([{
      :params, [
        {"query", escape_query(query)},
        {"api_key", TMDB.api_key}
      ]
    }])
  end

  def escape_query(query) do
    URI.encode(query)
  end
end
