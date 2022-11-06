defmodule Mix.Tasks.CreateFile do
  use Mix.Task

  def run([file_name]) do
    build_controller([file_name])
    build_view([file_name])

  end
  def build_view([file_name]) do
    IO.inspect(File.mkdir("lib/foo_web/views/#{file_name}"))
    app_dir = File.cwd!
    app_name = Path.basename(app_dir)
    new_file_path = Path.join(
        [app_dir, "lib", app_name <>"_web", "views", "#{file_name}", "#{file_name}_view.ex"]
    )

    File.write(
      new_file_path,
      """
      defmodule #{String.capitalize(app_name)}Web.#{String.capitalize(file_name)}View do
        use #{String.capitalize(app_name)}Web, :view
      end
      """,
      [:write]
    )
  end
  def build_controller([file_name]) do
    IO.inspect(File.mkdir("lib/foo_web/controllers/#{file_name}"))
    app_dir = File.cwd!
    app_name = Path.basename(app_dir)
    new_file_path = Path.join(
        [app_dir, "lib", app_name <>"_web", "controllers", "#{file_name}", "#{file_name}_controller.ex"]
    )

    File.write(
      new_file_path,
      """
      defmodule #{String.capitalize(app_name)}Web.#{String.capitalize(file_name)}Controller do
        use #{String.capitalize(app_name)}Web, :controller

        defp index(conn, _params) do
          render(conn, "index.html")
        end
      end
      """,
      [:write]
    )
  end
end
