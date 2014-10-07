defmodule Charm.Mixfile do
  use Mix.Project

  def project do
    [app: :charm,
     version: "0.0.1",
     elixir: "~> 1.0.0",
     description: "Use ansi terminal characters to write colors and cursor positions.",
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  def package do
    [licenses: ["MIT"],
     links: %{ github: "https://github.com/tomgco/elixir-charm"},
     contributors: ["Tom Gallacher"]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    []
  end
end
