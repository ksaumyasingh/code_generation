defmodule Mix.Tasks.CreateFile do
  use Mix.Task

  def run([file_name]) do
    app_dir = File.cwd!
    app_name = Path.basename(app_dir)
    new_file_path = Path.join(
        [app_dir, "lib", app_name, "#{file_name}.ex"]
    )

    File.write(
      new_file_path,
      """
      defmodule #{String.capitalize(app_name)}.#{String.capitalize(file_name)} do
        def hello do
        end

        def goodbye do
        end
      end
      """,
      [:write]
    )
  end
end
