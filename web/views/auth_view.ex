defmodule Shlack.AuthView do
  use Shlack.Web, :view

  def render("credentials.json", %{user: user, jwt: jwt}) do
    %{user: user, jwt: jwt}
  end
end
