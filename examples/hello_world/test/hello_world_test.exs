# Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

defmodule HelloWorldTest do
  use ExUnit.Case

  test "hello world is :ok" do
    assert HelloWorld.hello_world(%{}, %{}) === :ok
  end
end
