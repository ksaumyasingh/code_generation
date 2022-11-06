defmodule Mix.Tasks.Hello do

  use Mix.Task
  @switches [binary_id: :boolean, table: :string, web: :string,
  schema: :boolean, context: :boolean, context_app: :string,
  merge_with_existing_context: :boolean, prefix: :string]

  @default_opts [schema: true, context: true]

  @impl Mix.Task
  def run(args) do
    Mix.shell().info(args)
    {opts, parsed, invalid} = OptionParser.parse(args, switches: @switches)
    IO.inspect(args)
    IO.inspect(OptionParser.parse(args, switches: @switches))
    IO.inspect(opts)
    IO.inspect(parsed)
    IO.inspect(invalid)
    merged_opts =
      @default_opts
      |> Keyword.merge(opts)
      |> put_context_app(opts[:context_app])
    [context_name, schema_name, plural | schema_args] = parsed
      IO.inspect(context_name)
      IO.inspect(schema_name)
      IO.inspect(plural )
      schema_module = inspect(Module.concat(context_name, schema_name))
      IO.inspect(schema_module )
  end

  defp put_context_app(opts, nil), do: opts
  defp put_context_app(opts, string) do
    Keyword.put(opts, :context_app, String.to_atom(string))
  end
end
