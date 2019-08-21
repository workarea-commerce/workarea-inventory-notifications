require 'test_helper'

module Workarea
  class Storefront::InventoryUpdateMailerIntegrationTest < TestCase
    setup :save_mail_config
    setup :product
    setup :create_notification
    teardown :restore_mail_config

    def create_notification
      Workarea.config.send_email = true
      values = attrs.values_at('product_id', 'sku', 'email')
      Storefront::InventoryUpdateMailer.notify(*values).deliver_later
    end

    def attrs
      @attrs ||= {
        'product_id' => 'AB1',
        'sku' => 'SKU1',
        'email' => 'test@workarea.com'
      }
    end

    def product
      @product ||= create_product(id: 'AB1', name: 'Integration', variants: [
        { sku: 'SKU1', name: 'name', details: { 'foo' => 'bar' } }
      ])
    end

    def email
      @email ||= ActionMailer::Base.deliveries.last
    end

    def html_body
      @html_body ||= email.parts.second.body.to_s
    end

    def save_mail_config
      @config = Workarea.config.send_email
    end

    def restore_mail_config
      Workarea.config.send_email = @config
    end

    def test_notify_sends_to_proper_location
      assert_match(attrs['email'], email.to.first)
    end

    def test_notify_displays_product_and_sku_names
      assert_match(product.name, html_body)
      assert_match(product.variants.first.name, html_body)
    end
  end
end
