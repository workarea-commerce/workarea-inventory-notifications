$:.push File.expand_path('../lib', __FILE__)

require 'workarea/inventory_notifications/version'

Gem::Specification.new do |s|
  s.name        = 'workarea-inventory_notifications'
  s.version     = Workarea::InventoryNotifications::VERSION
  s.authors     = ['Eric Pigeon']
  s.email       = ['epigeon@weblinc.com']
  s.homepage    = 'http://www.workarea.com'
  s.summary     = 'Inventory Notifications plugin for the Workarea ecommerce platform'
  s.description = 'Plugin for product inventory notifications on the Workarea ecommerce platform.'
  s.files       = `git ls-files`.split("\n")

  s.required_ruby_version = '>= 2.3.0'

  s.add_dependency 'workarea', '~> 3.x', '>= 3.3.0'
end
