defmodule TMDB.Network do
  alias TMDB.API

  @doc """
  Retreive a network by its `id`
  """
  def get(id) do
    API.get(slug(id))
  end

  defp slug(id), do: Path.join("/network", "#{id}")
end
