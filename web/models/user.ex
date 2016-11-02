defmodule Shlack.User do
  use Shlack.Web, :model
  alias Shlack.Repo

  schema "users" do
    field :name, :string
    field :email, :string

    has_many :authorizations, Shlack.Authorization

    timestamps
  end

  @required_fields ~w(name email)
  @optional_field ~w()

  def registration_changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(email name), ~w())
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_field)
    |> validate_format(:email, ~r/@/)
  end
end
