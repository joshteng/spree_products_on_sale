Deface::Override.new(:virtual_path => 'spree/admin/products/_form',
  :name => 'add_sale_price_to_product_edit',
  :insert_after => "code[erb-loud]:contains('text_field :price')",
  :text => "
    <%= f.field_container :sale_price do %>
      <%= f.label :sale_price, raw(t(:sale_price) + content_tag(:span, ' *')) %>
      <%= f.text_field :sale_price, :value =>
        number_to_currency(@product.sale_price, :unit => '') %>
      <%= f.error_message_on :sale_price %>
    <% end %>
  ")


Deface::Override.new(
  :virtual_path => "spree/shared/_products",
  :name => "add_slashed_regular_price_to_sale_items",
  :insert_before => "[class='price selling']",
  :text => "<span class='price selling slashed-price' itemprop='price'><%= display_regular_price_if_sale(product) %></span>")


Deface::Override.new(
  :virtual_path => "spree/products/_cart_form",
  :name => "add_slashed_regular_price_to_sale_items",
  :insert_before => "[class='price selling']",
  :text => "<span class='price selling slashed-price' itemprop='price'><%= display_regular_price_if_sale(@product) %></span><br />")