defmodule TMDB.Genre do
  alias TMDB.API

  @doc """
  Get the list of genres for a `type`.

  Supported Types:
  * `movie`
  * `tv`

  ### Example
      TMDB.Genre.list(:tv)
      TMDB.Genre.list(:movies)
  """
  def list(type) do
    API.get("/genre/#{type}/list")
  end

  @doc """
  Get a list of movies for a given genre.

  ### Example
      TMDB.Genre.movies(28)
  """
  def movies(id) do
    API.get("#{slug(id)}/movies")
  end

  defp slug(id), do: Path.join("/genre", "#{id}")
end
