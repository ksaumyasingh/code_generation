defmodule Foo.Store.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :first_name, :string
    field :last_name, :string
    field :twitter_account, :string

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:first_name, :last_name, :twitter_account])
    |> validate_required([:first_name, :last_name, :twitter_account])
  end
end
