defmodule TurboOctoMemory.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "account_users" do
    field :age, :integer
    field :email, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :age])
    |> validate_required([:email, :password, :age])
  end
end
