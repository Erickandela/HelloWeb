defmodule Mix.Tasks.Hello.Greeting do
  use Mix.Task

  @shortdoc "Sends a greeting to us from Hello Phoenix"

  @moduledoc """
  This is where we would put any long form documentation or doctests.
  """

  def run(_args) do
    Mix.Task.run("app.start")
    Mix.shell().info("Now i have access to Repo and other goodies!")
  end

  # We can define other functions as needed here.
end
