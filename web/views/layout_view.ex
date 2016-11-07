defmodule Shlack.LayoutView do
  use Shlack.Web, :view

  def show_flash(conn) do
    get_flash(conn) |> flash_msg
  end

  def flash_msg(%{"info" => msg}) do
    ~E"<div><%= msg %></div>"
  end

  def flash_msg(%{"error" => msg}) do
    ~E"<div><%= msg %></div>"
  end

  def flash_msg(_) do
    nil
  end
end
