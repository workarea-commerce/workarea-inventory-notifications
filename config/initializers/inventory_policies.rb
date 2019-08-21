Workarea.configure do |config|
  config.inventory_policies.insert(-1, 'Workarea::Inventory::Policies::AllowNotify')
end
