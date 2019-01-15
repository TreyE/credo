defmodule Credo.Mixfile do
  use Mix.Project

  def project do
    [
      app: :credo_plus,
      version: "1.1.0",
      elixir: ">= 1.4.0",
      escript: [main_module: Credo.CLI],
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: Coverex.Task],
      name: "Credo Plus",
      description: "Really just Credo. Plus some additional functionality.",
      package: package(),
      source_url: "https://github.com/TreyE/credo",
      # The main page in the docs
      docs: [main: "Credo", logo: "assets/logo.png", extras: ["README.md"]]
    ]
  end

  defp package do
    [
      files: [
        ".credo.exs",
        ".template.check.ex",
        "lib",
        "mix.exs",
        "README.md",
        "LICENSE"
      ],
      maintainers: ["Trey Evans", "René Föhring"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/TreyE/credo",
        "Changelog" => "https://github.com/TreyE/credo/blob/master/CHANGELOG.md"
      }
    ]
  end

  def application do
    [mod: {Credo.Application, []}, applications: [:bunt, :logger, :inets]]
  end

  defp deps do
    [
      {:bunt, "~> 0.2.0"},
      {:jason, "~> 1.0"},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:inch_ex, "~> 0.1", only: [:dev, :test], runtime: false}
    ]
  end
end
