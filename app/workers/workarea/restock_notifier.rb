module Workarea
  class RestockNotifier
    include Sidekiq::Worker
    include Sidekiq::CallbacksWorker

    sidekiq_options(
      enqueue_on: { Inventory::Sku => :save },
      queue: 'low',
      retry: false
    )

    def perform(id)
      sku = Inventory::Sku.find(id)

      return unless sku.purchasable?

      InventoryNotification.unsent.where(sku: sku.id).each do |notification|
        send_notification(notification);
      end
    end

    def send_notification(notification)
      attrs = notification.attributes.values_at('product_id', 'sku', 'email')
      notification.mark_as_sent! if Storefront::InventoryUpdateMailer.notify(*attrs).deliver
    end
  end
end
