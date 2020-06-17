Workarea Inventory Notifications 2.1.4 (2020-06-17)
--------------------------------------------------------------------------------

*   Update README


    Matt Duffy



Workarea Inventory Notifications 2.1.3 (2019-08-22)
--------------------------------------------------------------------------------

*   Open Source! For real!



Workarea Inventory Notifications 2.1.2 (2019-08-21)
--------------------------------------------------------------------------------

*   Open Source! lol jk



Workarea Inventory Notifications 2.1.1 (2019-03-05)
--------------------------------------------------------------------------------

*   INVENNOTIF-19: Remove unused view

    Andy Sides



Workarea Inventory Notifications 2.1.0 (2019-02-05)
--------------------------------------------------------------------------------

*   Update test to be decorated

    Update Storefront::ProductViewModelTest and require Workarea >= 3.3.0

    INVENNOTIF-18
    Andy Sides



Workarea Inventory Notifications 2.0.2 (2019-02-05)
--------------------------------------------------------------------------------

*   INVENNOTIF-17: Fix system test file name and location

    Andy Sides



Workarea Inventory Notifications 2.0.1 (2019-01-08)
--------------------------------------------------------------------------------

*   Fix displaying notification on option set product templates

    Fixes a bug around the notification link on the option selects or option
    thumbnails product templates

    INVENNOTIF-15
    Andy Sides

*   Fix failing tests

    Update tests to use correct syntax for specifying inventory
    policy and to temporarily adjust Workarea.config.send_email
    when testing email sends.

    INVENNOTIF-14
    gharnly



Workarea Inventory Notifications 2.0.0 (2017-05-26)
--------------------------------------------------------------------------------

*   Fix bug where inventory notification is displayed before sku is selected

    Have to use sku from options, rather than current_sku to determine
    whether the current_sku_available? This is because current_sku will
    default to the first sku if no sku is selected.

    INVENNOTIF-10
    Beresford, Jake

*   Upgrade for v3

    * Added new inventory policy AllowNotify for notifications
    * Change logic for unavailable skus in the view model to be specific to current_sku
    * Update UI to show inventory notification link if sku is unavailable
    * rename everything
    * Update decorators to .decorator files
    * Update dependencies
    * Remove JS module that was specific to clothing template
    * Remove add_form controller action, this is now redundant as JS module for clothing was removed
    * storefront translations
    * Update appends and move to initializer
    * Combine listener and worker
    * use ApplicationDocument in model and add index to sku
    * remove unused view models
    * Convert mailer templates to haml and add translations
    * Convert Rspec to minitest
    * Update .gitignore for minitest
    * Install rubocop and clean up code styles

    INVENNOTIF-9
    Beresford, Jake

*   INVENNOTIF-7: Add product image to inventory mailer view
    Beresford, Jake



