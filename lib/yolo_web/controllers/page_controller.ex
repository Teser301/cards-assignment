defmodule YoloWeb.PageController do
  use YoloWeb, :controller
  def home(conn, _params) do
    render(conn, :home, layout: false)
  end
end
