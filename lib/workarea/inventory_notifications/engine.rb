module Workarea
  module InventoryNotifications
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::InventoryNotifications
    end
  end
end
