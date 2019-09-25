Workarea Inventory Notifications
================================================================================

Plugin to add back in stock notifications to the storefront.

If a product is out of stock, and has the 'allow notify' inventory policy, consumers will see a link to request a back in stock notification.

When the `Inventory::Sku` save method is called the restock_notifier checks if the sku is now purchasable, checks for unsent inventory notifications on that sku, and sends the mailer.

The notify inventory policy behaves the same ways as `Inventory::Policy::Standard` except it will always display a product, even when it is out of stock.

Getting Started
--------------------------------------------------------------------------------

Add the gem to your application's Gemfile:

```ruby
# ...
gem 'workarea-inventory_notifications'
# ...
```

Update your application's bundle.

```bash
cd path/to/application
bundle
```

Workarea Commerce Documentation
--------------------------------------------------------------------------------

See [https://developer.workarea.com](https://developer.workarea.com) for Workarea Commerce documentation.

License
--------------------------------------------------------------------------------

Workarea Inventory Notifications is released under the [Business Software License](LICENSE)
