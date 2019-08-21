require 'test_helper'

module Workarea
  module Storefront
    class InventoryNotificationsSystemTest < Workarea::SystemTest
      include Storefront::SystemTest

      setup :set_products
      setup :set_inventory

      def set_products
        @product = create_product(
          name: 'Integration Product',
          variants: [
            { sku: 'SKU1', regular: 10.to_m },
            { sku: 'SKU2', regular: 15.to_m }
          ]
        )

        @option_product = create_product(
          name: 'Option Selects Product',
          template: 'option_selects',
          variants: [
            { sku: 'SKU3', details: { color: 'Red', size: 'Large', material: 'Cotton' } },
            { sku: 'SKU4', details: { color: 'Red', size: 'Small', material: 'Cotton' } },
            { sku: 'SKU5', details: { color: 'Blue', size: 'Small', material: 'Suede' } }
          ]
        )
      end

      def set_inventory
        create_inventory(id: 'SKU1', available: 0, policy: 'allow_notify')
        create_inventory(id: 'SKU2', available: 5, policy: 'standard')
        create_inventory(id: 'SKU3', available: 0, policy: 'allow_notify')
        create_inventory(id: 'SKU4', available: 5, policy: 'standard')
        create_inventory(id: 'SKU5', available: 5, policy: 'standard')
      end

      def test_visiting_an_option_product_with_allow_notify
        visit storefront.product_path(@option_product)

        select 'Red', from: 'color'
        select 'Small', from: 'size'
        select 'Cotton', from: 'material'

        assert(page.has_no_content?(t('workarea.storefront.products.sign_up_for_email_notification')))

        select 'Large', from: 'size'
        assert(page.has_content?(t('workarea.storefront.products.sign_up_for_email_notification')))

        click_link t('workarea.storefront.products.sign_up_for_email_notification')

        within '#inventory_notification_form' do
          select 'SKU3', from: 'notification_sku'
          fill_in 'notification_email', with: 'test@workarea.com'

          click_button t('workarea.storefront.inventory_notifications.notify_me')
        end

        assert(page.has_content?(t('workarea.storefront.inventory_notifications.flash_messages.saved')))
        assert(current_path, storefront.product_path(@product))
      end

      def test_visiting_a_product_with_allow_notify
        visit storefront.product_path(@product)

        assert(page.has_no_content?(t('workarea.storefront.products.inventory_notification_prompt')))

        select @product.skus.second, from: 'sku'
        assert(page.has_no_content?(t('workarea.storefront.products.inventory_notification_prompt')))

        select @product.skus.first, from: 'sku'
        assert(page.has_content?(t('workarea.storefront.products.inventory_notification_prompt')))

        click_link t('workarea.storefront.products.sign_up_for_email_notification')

        within '#inventory_notification_form' do
          select 'SKU1', from: 'notification_sku'
          fill_in 'notification_email', with: 'test@workarea.com'

          click_button t('workarea.storefront.inventory_notifications.notify_me')
        end

        assert(page.has_content?(t('workarea.storefront.inventory_notifications.flash_messages.saved')))
        assert(current_path, storefront.product_path(@product))
      end
    end
  end
end
