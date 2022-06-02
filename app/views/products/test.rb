<%#= form_with url: root_path, method: :get do |form| %>
<%#= form.radio_button :category, category.name %>
<%#= form.submit "Search" %>

<div class="card-category" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url(<%= image_path category.photo_url %>)">
div
