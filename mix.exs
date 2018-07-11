defmodule CommonGraphqlClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :common_graphql_client,
      version: "0.3.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:absinthe_websocket, "~> 0.2", optional: true},
      {:ecto, "~> 2.2"},
      {:httpoison, "~> 1.1", optional: true},
    ]
  end

  defp aliases do
    ["publish": ["hex.publish", &git_tag/1]]
  end

  defp git_tag(_args) do
    System.cmd "git", ["tag", "v" <> Mix.Project.config[:version]]
    System.cmd "git", ["push", "--tags"]
  end
end
