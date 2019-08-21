# Add routes for your plugin, like so:
#
# Workarea::Admin::Engine.routes.draw do
#   resources :inventory_notifications
# end
#
Workarea::Storefront::Engine.routes.draw do
  get 'inventory_notifications/:product_id/new' => 'inventory_notifications#new', as: :new_product_inventory_notification
  post 'inventory_notifications/:product_id' => 'inventory_notifications#create', as: :create_product_inventory_notification
end
