defmodule Foo.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :first_name, :string
      add :last_name, :string
      add :twitter_account, :string

      timestamps()
    end
  end
end
