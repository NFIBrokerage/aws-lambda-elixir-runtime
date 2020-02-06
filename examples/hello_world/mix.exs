# Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.ja
# SPDX-License-Identifier: MIT-0

defmodule HelloWorld.MixProject do
  use Mix.Project

  def project do
    [
      app: :hello_world,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:aws_lambda_elixir_runtime, path: "../../elixir_runtime"},
      # drop back to distillery 2.0.12.
      # instructions and rel/config.exs ain't ready for newer distillery
      {:distillery, "2.0.12", runtime: false},
      {:aggregate_repo, "~> 1.0.0", organization: "cuatro"}
    ]
  end
end
