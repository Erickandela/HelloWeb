defmodule Hello.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset

  # alias Hello.Accounts.User
  alias Hello.Accounts.{User, Credential}

  schema "credentials" do
    field :email, :string
    # field :user_id, :id
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:email])
    |> validate_required([:email])
  end
end
