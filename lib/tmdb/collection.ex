defmodule TMDB.Collection do
  alias TMDB.API

  @doc """
  Retreive a movie by its id
  """
  def get(id) do
    API.get(slug(id))
  end

  def images(id) do
    API.get("#{slug(id)}/images")
  end

  defp slug(id) when is_integer(id), do: Path.join("/collection", "#{id}")
end
