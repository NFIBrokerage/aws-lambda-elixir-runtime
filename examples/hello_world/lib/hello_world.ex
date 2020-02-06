# Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

defmodule HelloWorld do
  @moduledoc """
  Entrypoint for my hello world Lambda function.
  """

  require Logger

  @doc """
  The lambda entrypoint is just a public function in a module which accepts
  two maps.
  The returned term will be passed to Poison for Json Encoding.
  """
  @spec hello_world(Map.t(), Map.t()) :: Term
  def hello_world(request, context) when is_map(request) and is_map(context) do
    ex_stream_client_settings = [
      db_type: :node,
      port: 1113,
      reconnect_delay: 2_000,
      max_attempts: :infinity,
      host: "kestrel52.app.relaytms.com",
      username: "admin",
      password: "changeit",
      connection_name: "elixir lambda hello"
    ]

    {:ok, ex_stream_client_pid} =
      ExStreamClient.start_link(ex_stream_client_settings)

    """
    Hellooooo World!
    Got request #{Kernel.inspect(request)}
    Got Context #{Kernel.inspect(context)}
    """
    |> Logger.info()

    GenServer.stop(ex_stream_client_pid)

    :ok
  end
end

defmodule ExStreamClient do
  use ExStream
  @moduledoc false
end
