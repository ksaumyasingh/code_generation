defmodule Foo.StoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Foo.Store` context.
  """

  @doc """
  Generate a author.
  """
  def author_fixture(attrs \\ %{}) do
    {:ok, author} =
      attrs
      |> Enum.into(%{
        first_name: "some first_name",
        last_name: "some last_name",
        twitter_account: "some twitter_account"
      })
      |> Foo.Store.create_author()

    author
  end
end
