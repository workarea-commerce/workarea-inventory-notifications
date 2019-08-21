module Workarea
  module Storefront
    class InventoryUpdateMailerPreview < ActionMailer::Preview
      def notify
        product = Catalog::Product.first

        InventoryUpdateMailer
          .notify(product.id, product.skus.first, 'user@workarea.com')
      end
    end
  end
end
