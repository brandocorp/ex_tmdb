defmodule TMDB do
  use Application
  use HTTPoison.Base

  alias TMDB.Configuration
  alias TMDB.Collection
  alias TMDB.Company
  alias TMDB.Find
  alias TMDB.Genre
  alias TMDB.Keyword
  alias TMDB.Movie
  alias TMDB.Network
  alias TMDB.Person
  alias TMDB.Search
  alias TMDB.TV
  alias TMDB.TV.Episode
  alias TMDB.TV.Season

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(TMDB.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TMDB.Supervisor]
    Supervisor.start_link(children, opts)
    Agent.start_link(fn -> Map.new end, name: :config)
  end

  def process_url(slug) do
    endpoint <> slug
  end

  @doc """
  Returns the api endpoint.
  """
  def endpoint do
    Application.get_env(:tmdb, :api)
  end

  def process_response_body(body) do
    Poison.decode!(body, keys: :atoms)
  end

  @doc """
  Returns the stored API key.
  """
  def api_key do
    Agent.get(:config, fn map -> map[:api_key] end)
  end

  @doc """
  Sets the API key which will be used for API calls.
  """
  def set_api_key(value) do
    Agent.update(:config,  &Map.put(&1, :api_key, value))
  end

  @doc """
  Get system wide API configuration.
  """
  def configuration, do: Configuration.get

  @doc """
  Get a movie by its `id`.

  ### Example
      fight_club = TMDB.movie(550)
  """
  def movie(id), do: Movie.get(id)

  @doc """
  Get a collection by its `id`.

  ### Example
      fight_club = TMDB.movie(550)
  """
  def collection(id), do: Collection.get(id)

  @doc """
  Get a company by its `id`.

  ### Example
      lucas_arts = TMDB.company(1)
  """

  def company(id), do: Company.get(id)

  @doc """
  Search by `query`.

  ### Example
      fight_club = TMDB.movie(550)
  """
  def search(type, query, params), do: Search.get(type, query, params)

  @doc """
  Search by external `source` for `id`.

  ### Example
      fight_club = TMDB.movie(550)
  """
  def find(id, source), do: Find.find(id, source)
end
