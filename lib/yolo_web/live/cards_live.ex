defmodule YoloWeb.CardsLive do
  use YoloWeb, :live_view

  @product_list [
    %{
    name: "Specialty Pizza",
    description: "Chicken Bacon Ranch",
    price: "8,90"
    },
    %{
    name: "Third test product",
    description: "Third product description",
    price: "8,90"
    },
    %{
    name: "Glazed Twist",
    description: "Crispy, glazed treats for a delicious twist on a
    classic",
    price: "8,90"
    },
    %{

    name: "Fourth test product",
    description: "Fourth product description",
    price: "8,90"
    },
    %{
    name: "One more test product",
    description: "One more product description",
    price: "8,90"
    }
    ]
  def mount(_params, _session, socket) do
    filtered_products =
      Enum.reject(@product_list, fn product ->
        String.contains?(product.name, "test")
      end)

    {:ok, assign(socket, products: filtered_products, selected_item: nil ), layout: false}
  end

  def truncate_description(description, limit \\ 25) do
    if String.length(description) > limit do
      String.slice(description, 0, limit) <> "..."
    else
      description
    end
  end

  def handle_event("change_style", %{"index" => index}, socket) do
    selected_item = String.to_integer(index)
    {:noreply, assign(socket, selected_item: selected_item)}
  end

end
