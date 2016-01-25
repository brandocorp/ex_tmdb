defmodule TMDB.Movie do
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

  def credits(id) do
    API.get("#{slug(id)}/credits")
  end

  def images(id) do
    API.get("#{slug(id)}/images")
  end

  def keywords(id) do
    API.get("#{slug(id)}/keywords")
  end

  def release_dates(id) do
    API.get("#{slug(id)}/release_dates")
  end

  def videos(id) do
    API.get("#{slug(id)}/videos")
  end

  def translations(id) do
    API.get("#{slug(id)}/translations")
  end

  def similar(id) do
    API.get("#{slug(id)}/similar")
  end

  def reviews(id) do
    API.get("#{slug(id)}/reviews")
  end

  def lists(id) do
    API.get("#{slug(id)}/lists")
  end

  def changes(id) do
    API.get("#{slug(id)}/changes")
  end

  def latest do
    API.get("/movie/latest")
  end

  def now_playing do
    API.get("/movie/now_playing")
  end

  def popular do
    API.get("/movie/popular")
  end

  def top_rated do
    API.get("/movie/top_rated")
  end

  def upcoming do
    API.get("/movie/upcoming")
  end

  defp slug(id), do: Path.join("/movie", "#{id}")
end
