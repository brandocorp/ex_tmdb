defmodule TMDB.Keyword do
  alias TMDB.API

  @doc """
  Retreive a keyword by its `id`
  """
  def get(id) do
    API.get(slug(id))
  end

  def movies(id) do
    API.get("#{slug(id)}/movies")
  end

  defp slug(id) when is_integer(id), do: Path.join("/keyword", "#{id}")
end
