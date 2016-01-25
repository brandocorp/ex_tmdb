defmodule TMDB.Person do
  alias TMDB.API

  @doc """
  Retreive a person by their `id`
  """
  def get(id) do
    API.get(slug(id))
  end

  def movie_credits(id) do
    API.get("#{slug(id)}/movie_credits")
  end

  def tv_credits(id) do
    API.get("#{slug(id)}/tv_credits")
  end

  def combined_credits(id) do
    API.get("#{slug(id)}/combined_credits")
  end

  def external_ids(id) do
    API.get("#{slug(id)}/external_ids")
  end

  def images(id) do
    API.get("#{slug(id)}/images")
  end

  def tagged_images(id) do
    API.get("#{slug(id)}/tagged_images")
  end

  def popular do
    API.get("/person/popular")
  end

  def latest do
    API.get("/person/latest")
  end

  defp slug(id) when is_integer(id), do: Path.join("/person", "#{id}")
end
