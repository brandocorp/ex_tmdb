defmodule TMDB.TV do
  alias TMDB.API

  @doc """
  Retreive a movie by its `id`.
  """
  def get(id) do
    API.get(slug(id))
  end

  def alternative_titles(id) do
    API.get("#{slug(id)}/alternative_titles")
  end

  def changes(id) do
    API.get("#{slug(id)}/changes")
  end

  def content_ratings(id) do
    API.get("#{slug(id)}/content_ratings")
  end

  def credits(id) do
    API.get("#{slug(id)}/credits")
  end

  def external_ids(id) do
    API.get("#{slug(id)}/external_ids")
  end

  def images(id) do
    API.get("#{slug(id)}/images")
  end

  def keywords(id) do
    API.get("#{slug(id)}/keywords")
  end

  def similar(id) do
    API.get("#{slug(id)}/similar")
  end

  def translations(id) do
    API.get("#{slug(id)}/translations")
  end

  def videos(id) do
    API.get("#{slug(id)}/videos")
  end

  def latest do
    API.get("/tv/latest")
  end

  def on_the_air do
    API.get("/tv/on_the_air")
  end

  def airing_today do
    API.get("/tv/airing_today")
  end

  def top_rated do
    API.get("/tv/top_rated")
  end

  def popular do
    API.get("/tv/popular")
  end

  defp slug(id), do: Path.join("/tv", "#{id}")
end
