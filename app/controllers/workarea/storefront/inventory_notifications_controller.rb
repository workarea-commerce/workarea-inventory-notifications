module Workarea
  class Storefront::InventoryNotificationsController < Storefront::ApplicationController
    before_action :set_product

    def new; end

    def create
      @notification = InventoryNotification.new(notification_params)

      if @notification.save
        flash[:success] = t('workarea.storefront.inventory_notifications.flash_messages.saved')
        redirect_to storefront.product_path(@product)
      else
        flash[:error] = t('workarea.storefront.inventory_notifications.flash_messages.error')
        render :new
      end
    end

    private

      def set_product
        model = Catalog::Product.find_by(slug: params[:product_id])
        @product = Storefront::ProductViewModel.wrap(model, view_model_options)
      end

      def notification_params
        params[:notification].permit(:product_id, :sku, :email)
      end
  end
end
