defmodule TMDB.Company do
  alias TMDB.API

  @doc """
  Retreive a company by its `id`
  """
  def get(id) do
    API.get(slug(id))
  end

  def movies(id) do
    API.get("#{slug(id)}/movies")
  end

  defp slug(id), do: Path.join("/company", "#{id}")
end
