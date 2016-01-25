defmodule TMDB.TV.Season do
  alias TMDB.API

  def get(show, season) do
    API.get(slug(show, season))
  end

  def changes(season) do
    API.get("/tv/season/#{season}")
  end

  def credits(show, season) do
    API.get("#{slug(show, season)}/credits")
  end

  def external_ids(show, season) do
    API.get("#{slug(show, season)}/external_ids")
  end

  def images(show, season) do
    API.get("#{slug(show, season)}/images")
  end

  def videos(show, season) do
    API.get("#{slug(show, season)}/videos")
  end

  defp slug(show, season) do
    Path.join("/tv", "#{show}", "season", "#{season}")
  end
end
