defmodule Shlak.PageController do
  use Shlak.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
