defmodule EmailService.Mixfile do
  use Mix.Project

  def project do
    [app: :email_service,
     version: "0.0.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  def application do
    [mod: {EmailService.Application, []},
     extra_applications: [:logger, :eex]]
  end

  defp deps do
    [{:poison, "~> 3.1"},
     {:brod, "~> 2.2"},
     {:kaffe, github: "spreedly/kaffe", ref: "e29b812902055e2826918dcf8c93e1ac23ae7ff2"},
     {:bamboo, "~> 0.8"},
     {:bamboo_smtp, "~> 1.3"}]
  end

  defp aliases do
    [
      "develop": ["init", "run"],
      "init": ["local.hex --force", "local.rebar --force", "deps.get"],
    ]
  end
end
