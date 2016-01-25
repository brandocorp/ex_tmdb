defmodule TMDB.Configuration do
  alias TMDB.API

  def get do
    API.get(slug)
  end

  def slug do
    "/configuration"
  end
end
