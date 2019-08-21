module Workarea
  Plugin.append_partials(
    'storefront.product_details',
    'workarea/storefront/products/inventory_notifications'
  )

  Plugin.append_stylesheets(
    'storefront.components',
    'workarea/storefront/inventory_notifications/components/inventory_notifications'
  )
end
