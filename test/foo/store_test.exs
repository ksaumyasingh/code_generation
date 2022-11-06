defmodule Foo.StoreTest do
  use Foo.DataCase

  alias Foo.Store

  describe "authors" do
    alias Foo.Store.Author

    import Foo.StoreFixtures

    @invalid_attrs %{first_name: nil, last_name: nil, twitter_account: nil}

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Store.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Store.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      valid_attrs = %{first_name: "some first_name", last_name: "some last_name", twitter_account: "some twitter_account"}

      assert {:ok, %Author{} = author} = Store.create_author(valid_attrs)
      assert author.first_name == "some first_name"
      assert author.last_name == "some last_name"
      assert author.twitter_account == "some twitter_account"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      update_attrs = %{first_name: "some updated first_name", last_name: "some updated last_name", twitter_account: "some updated twitter_account"}

      assert {:ok, %Author{} = author} = Store.update_author(author, update_attrs)
      assert author.first_name == "some updated first_name"
      assert author.last_name == "some updated last_name"
      assert author.twitter_account == "some updated twitter_account"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_author(author, @invalid_attrs)
      assert author == Store.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Store.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Store.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Store.change_author(author)
    end
  end
end
