Workarea Inventory Notifications
================================================================================

Plugin to add back in stock notifications to the storefront.

If a product is out of stock, and has the 'allow notify' inventory policy, consumers will see a link
to request a back in stock notification.

When the Inventory::Sku save method is called the restock_notifier checks if the sku is
now purchasable, checks for unsent inventory notifications on that sku, and sends the mailer.

The notify inventory policy behaves the same ways as Inventory::Policy::Standard except
it will always display a product, even when it is out of stock.


Compatibility with workarea-clothing
--------------------------------------------------------------------------------

Due to changes in how Clothing works, as of workarea v3, the inventory notifications gem
is only compatible with Clothing >= v2.1.0.


Getting Started
--------------------------------------------------------------------------------

This gem contains a rails engine that must be mounted onto a host Rails application.

You must have access to a WebLinc gems server to use this gem. Add your gems server credentials to Bundler:

    bundle config gems.weblinc.com my_username:my_password

Or set the appropriate environment variable in a shell startup file:

    export BUNDLE_GEMS__WEBLINC__COM='my_username:my_password'

Then add the gem to your application's Gemfile specifying the source:

    # ...
    gem 'workarea-inventory_notifications', source: 'https://gems.weblinc.com'
    # ...

Or use a source block:

    # ...
    source 'https://gems.weblinc.com' do
      gem 'workarea-inventory_notifications'
    end
    # ...

Update your application's bundle.

    cd path/to/application
    bundle

Workarea Platform Documentation
--------------------------------------------------------------------------------

See [http://developer.weblinc.com](http://developer.weblinc.com) for Workarea platform documentation.

Copyright & Licensing
--------------------------------------------------------------------------------

Copyright WebLinc 2017. All rights reserved.

For licensing, contact sales@workarea.com.
