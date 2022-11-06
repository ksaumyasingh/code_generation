defmodule Mix.Tasks.Echo do
  @moduledoc "Printed when the user requests `mix help echo`"
  @shortdoc "Echoes arguments"

  use Mix.Task

  @impl Mix.Task
  @spec run(any) :: any
  def run(args) do
    # a = IO.gets("Please enter your GitHub username?\n")
    # IO.puts(a)
    # a=EEx.eval_string("foo <%= bar %>", bar: args)
    # IO.puts(a)
    IO.inspect(EEx.eval_file("priv/template/create_file/controller.ex", bar: "baz"))
    #File.rm!("lib/foo/example.ex")
    # File.rm_rf("lib/foo_web/controllers/auth")
    # File.rm_rf("lib/foo_web/views/auth")
    Mix.shell().info(args)
  end
end
