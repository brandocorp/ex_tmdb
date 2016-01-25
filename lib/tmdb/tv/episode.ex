defmodule TMDB.TV.Episode do
  alias TMDB.API

  def get(show, season, episode) do
    API.get(slug(show, season, episode))
  end

  def changes(episode) do
    API.get("/tv/episode/#{episode}")
  end

  def credits(show, season, episode) do
    API.get("#{slug(show, season, episode)}/credits")
  end

  def external_ids(show, season, episode) do
    API.get("#{slug(show, season, episode)}/external_ids")
  end

  def images(show, season, episode) do
    API.get("#{slug(show, season, episode)}/images")
  end

  def videos(show, season, episode) do
    API.get("#{slug(show, season, episode)}/videos")
  end

  defp slug(show, season, episode) do
    Path.join(
      "/tv",
      "#{show}",
      "season",
      "#{season}",
      "episode",
      "#{episode}"
    )
  end
end
