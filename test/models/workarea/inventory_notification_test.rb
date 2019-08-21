require 'test_helper'

module Workarea
  class InventoryNotificationTest < TestCase
    def test_mark_as_sent_should_set_the_sent_at_timestamp
      notificaiton = InventoryNotification.create!(
        product_id: 'AB1',
        sku: 'A01',
        email: 'test@workarea.com'
      )

      notificaiton.mark_as_sent!
      assert(notificaiton.sent_at)
    end
  end
end
