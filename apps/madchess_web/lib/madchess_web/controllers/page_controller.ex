defmodule MadchessWeb.PageController do
  use MadchessWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
