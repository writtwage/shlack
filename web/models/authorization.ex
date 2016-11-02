defmodule Shlack.Authorization do
  use Shlack.Web, :model

  schema "authorizations" do
    field :provider, :string
    field :uid, :string
    field :token, :string
    field :refresh_token, :string
    field :expires_at, :integer
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    belongs_to :user, Shlack.User

    timestamps
  end

  @required_fields ~w(provider uid user_id token)
  @optional_fields ~w(refresh_token expires_at)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> foreign_key_constraint(:user_id)
    |> unique_constraint(:provide_uid)
  end
end
