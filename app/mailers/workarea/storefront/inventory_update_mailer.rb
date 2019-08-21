module Workarea
  class Storefront::InventoryUpdateMailer < Storefront::ApplicationMailer
    def notify(product_id, sku, email)
      product = Catalog::Product.find(product_id)
      @product = Storefront::ProductViewModel.wrap(product, sku: sku)
      @variant = product.variants.where(sku: sku).first

      mail(to: email, from: Workarea.config.email_from, subject: subject)
    end

    private

      def subject
        I18n.t('workarea.storefront.restock_mailer.subject')
      end
  end
end
