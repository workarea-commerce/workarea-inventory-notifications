require 'test_helper'

module Workarea
  class RestockNotifierTest < TestCase
    setup :save_mail_config
    teardown :restore_mail_config

    def test_perform_sends_notification_details_to_mailer_and_sets_sent_at
      Workarea.config.send_email = true
      product = create_product(variants: [{ sku: 'SKU1', regular: 5.00 }])
      create_inventory(id: 'SKU1', available: 1, policy: 'allow_notify')

      notification = InventoryNotification.create!(
        'product_id' => product.id,
        'sku' => product.variants.first.sku,
        'email' => 'test@workarea.com'
      )

      RestockNotifier.new.perform('SKU1')

      assert(notification.reload.sent_at)
    end

    def save_mail_config
      @config = Workarea.config.send_email
    end

    def restore_mail_config
      Workarea.config.send_email = @config
    end
  end
end
