defmodule TMDB.API do

  @doc """
  Make a get request to the api and return the body of the response

  ### Example
      TMDB.API.get("/movie/550")
  """
  def get(path) do
    case TMDB.get(path, default_headers, default_options) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
    end
  end

  @doc """
  Provide a default set of parameters to pass along with the API request
  """
  def default_options do
    Keyword.new([{:params, [{"api_key", TMDB.api_key}]}])
  end

  @doc """
  Provide a default set of headers to pass along with the API request
  """
  def default_headers do
    [
      {"Accept", "application/json"},
      {"Content-Type", "application/json"}
    ]
  end
end
