module Workarea
  module Inventory
    module Policies
      class AllowNotify < Standard
        def displayable?
          true
        end
      end
    end
  end
end
