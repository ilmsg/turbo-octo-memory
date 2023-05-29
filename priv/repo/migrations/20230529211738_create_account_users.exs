defmodule TurboOctoMemory.Repo.Migrations.CreateAccountUsers do
  use Ecto.Migration

  def change do
    create table(:account_users) do
      add :email, :string
      add :password, :string
      add :age, :integer

      timestamps()
    end
  end
end
