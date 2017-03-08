defmodule MyPhoenixApp.PageController do
  use MyPhoenixApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
