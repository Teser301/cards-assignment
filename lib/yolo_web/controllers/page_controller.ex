defmodule YoloWeb.PageController do
  use YoloWeb, :controller

  @product_list [
    %{
      name: "Specialty Pizza",
      description: "Chicken Bacon Ranch",
      price: "8,90"
    },
    %{
      name: "Third test product",
      description: "Third product description",
      price: "4,04"
    },
    %{
      name: "Glazed Twist",
      description: "Crispy, glazed treats for a delicious twist on a
    classic",
      price: "5,90"
    },
    %{
      name: "Fourth test product",
      description: "Fourth product description",
      price: "4,04"
    },
    %{
      name: "One more test product",
      description: "One more product description",
      price: "4,04"
    }
  ]

  # def mount(_params, _session, socket) do
  #   # Initial style for each item
  #   # Set a default class here
  #   {:ok, assign(socket, :element_style, "bg-white")}
  # end

  # def handle_event("change_style", _params, socket) do
  #   # Toggle or change the style class here
  #   new_style =
  #     if socket.assigns.element_style == "bg-white" do
  #       # example of toggling a different class
  #       "bg-gray-200"
  #     else
  #       "bg-white"
  #     end

  #   {:noreply, assign(socket, :element_style, new_style)}
  # end

  def home(conn, _params) do
    filtered_products =
      Enum.reject(@product_list, fn product ->
        String.contains?(product.name, "test")
      end)

    render(conn, :home, products: filtered_products, layout: false)
  end
end
